"
(PRCompilationPipeline buildPipe: PRPillarConfiguration new).

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'welcome'.
project build: PRHtmlOutput new.

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'presentation'.
project build: PRHtmlOutput new.
project build: PRPdfOutput new.

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'book'.
project build: PRHtmlOutput new.
project build: PRPdfOutput new.

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'basic-latex'.
project build: PRHtmlOutput new.
project build: PRPdfOutput new.
"
Class {
	#name : 'PRProject',
	#superclass : 'PRObject',
	#instVars : [
		'baseDirectory',
		'templatable',
		'toc'
	],
	#category : 'Pillar-Project-Core',
	#package : 'Pillar-Project',
	#tag : 'Core'
}

{ #category : 'testing' }
PRProject class >> isAbstract [
	^ false
]

{ #category : 'instance creation' }
PRProject class >> on: aDirectory [

	^ self new
		baseDirectory: aDirectory;
		yourself
]

{ #category : 'accessing' }
PRProject class >> pathToString: aPath [
	^ aPath pillarPrintString
]

{ #category : 'archetypes' }
PRProject >> archetypeNamed: aString [ 
	
	^ PRArchetype new
		name: aString;
		project: self;
		yourself
]

{ #category : 'accessing' }
PRProject >> baseDirectory [
	^ baseDirectory
]

{ #category : 'accessing' }
PRProject >> baseDirectory: aFileReference [ 
	baseDirectory := aFileReference
]

{ #category : 'templates' }
PRProject >> beTemplatable [

	templatable := true
]

{ #category : 'building' }
PRProject >> build: output [
	"Output is an instance of subclass of PRTarget"
	
	"set up information required prior to pipeline building"
	self prepareForTarget: output.
	
	"Build the pipeline and execute it on each file of the project"
	^ output buildOn: self
]

{ #category : 'checking' }
PRProject >> checkIsABook [
	"Raise a PRCommandError when my folder has no _support, which happens when pillar is not run in the folder of a book."

	(self baseDirectory / '_support') exists ifTrue: [ ^ self ].
	PRCommandError signal:
		'This folder is not a Pillar book: it has no _support folder. Run pillar in the folder of the book, or create a book with pillar archetype <name> (see pillar archetype --help).'
]

{ #category : 'accessing' }
PRProject >> configuration [

	| readConfiguration extension |
	extension := Dictionary new.
	extension at: 'outputDirectory' put: self defaultOutputDirectoryName.

	"Just for backwards compatibility"
	extension at: '_project' put: self.

	readConfiguration := self configurationFileReference exists
		                     ifFalse: [
		                     ConfigurationForPillar newFromDictionary:
			                     extension ]
		                     ifTrue: [
		                     self readConfigurationExtendedWith: extension ].
	^ readConfiguration
]

{ #category : 'accessing' }
PRProject >> configurationFileReference [
	
	^ self baseDirectory / 'pillar.conf'
]

{ #category : 'building' }
PRProject >> contributeToPipelineBuilding: aPRPipelineBuilder [ 
	
	self plugins do: [ :each | each contributeToPipelineBuilding: aPRPipelineBuilder ]
]

{ #category : 'accessing' }
PRProject >> customDirectory [
	"Answer the folder holding the changes of the book to its support files (see doc/book-layout.md)."

	^ self baseDirectory / '_custom'
]

{ #category : 'accessing' }
PRProject >> defaultOutputDirectoryName [
	^ '_result'
]

{ #category : 'accessing' }
PRProject >> defaultTarget [
	| defaultExport |
	defaultExport := [self configuration defaultExport ifEmpty: [ ^ PRAbsentTarget]] on: Error do: [ ^ PRAbsentTarget ]  .
	^ PRTarget targetByFormatName: defaultExport
]

{ #category : 'checking' }
PRProject >> displayNameOf: aFile [
	"Answer the name of aFile as the author knows it: relative to my folder when it is inside it."

	| file folder |
	file := aFile asAbsolute.
	folder := self baseDirectory asAbsolute.
	^ (file isContainedBy: folder)
		  ifTrue: [ (file relativeTo: folder) pathString ]
		  ifFalse: [ file fullName ]
]

{ #category : 'initialization' }
PRProject >> initialize [

	super initialize.
	templatable := false
]

{ #category : 'archetypes' }
PRProject >> installArchetypeNamed: archetypeName [
	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype validateExists.
	archetype installIn: self baseDirectory
]

{ #category : 'archetypes' }
PRProject >> installArchetypeNamed: archetypeName fromDirectory: pillarDirectory [
	
	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype directory: pillarDirectory.
	archetype validateExists.
	archetype installIn: self baseDirectory
]

{ #category : 'archetypes' }
PRProject >> installedArchetypeName [
	"Answer the name of the archetype the book was created from, recorded in _support/archetypeID."

	| file |
	file := self supportDirectory / 'archetypeID'.
	file exists ifFalse: [ PRMissingArchetypeID new signal ].
	^ file contents trimBoth
]

{ #category : 'templates' }
PRProject >> isTemplatable [

	^ templatable
]

{ #category : 'accessing' }
PRProject >> outputDirectory [
	"pay attention the output directory of a output document is more precise than the one of a project. 
	Indeed it will take into account the kind of document and add 'pdf', 'html'.... as subfolder.
	See PRPdfOutput >> #documentFor: to see the logic. For a project outputDirectory return the general place e.g. ..._result/"
	
	^ self baseDirectory resolve: self configuration outputDirectory
]

{ #category : 'accessing' }
PRProject >> plugins [
	
	^ (self configuration propertyAt: #plugins ifAbsent: [ #() ])
			collect: [ :each | | plugin |
				plugin := Smalltalk globals
					at: each asSymbol
					ifAbsent: [ self error: 'Could not resolve plugin: ', each ].
				plugin withContext: self ]
]

{ #category : 'building' }
PRProject >> prepareForTarget: target [
	"We want to build a given project i.e. PDF, HTML. We are setting up the system to be built. With prepareForTarget:, the actions that will be triggered are happening before the pipeline is set and executed."
	
	target prepareForExecutionOn: self.
	self plugins do: [ :each | each prepareForExecutionOn: self ]
]

{ #category : 'checking' }
PRProject >> readConfigurationExtendedWith: aDictionary [
	"Answer the configuration of pillar.conf; raise a PRCommandError when it is not valid STON."

	^ [
		  ConfigurationForPillar
			  newFromFile: self configurationFileReference
			  extendedWith: aDictionary ]
		  on: STONReaderError
		  do: [ :error |
				  PRCommandError signal:
					  'pillar.conf is not valid: ' , error messageText ]
]

{ #category : 'accessing' }
PRProject >> supportDirectory [
	
	^ self baseDirectory / '_support'
]

{ #category : 'accessing' }
PRProject >> tableOfContents [
	
	"
	Dead code left only to get idea when rebuilding it. 
	
	| tocFilePath tocFileName inputDoc |
	toc ifNotNil: [ ^ toc ].
	
	tocFilePath := self configuration propertyAt: 'tocFile' ifAbsent: [ ^ PRToc new ].
	tocFileName := self class pathToString: tocFilePath.
	inputDoc := PRPillarParserMain parse: (self baseDirectory / tocFileName) contents.
	
	^ toc := PRTocBuilderVisitor new
		documentSource: self baseDirectory / tocFileName;
		currentFile: tocFileName;
		inProcessFiles: (Array with: self baseDirectory / tocFileName);
		visit: inputDoc"
]

{ #category : 'archetypes' }
PRProject >> updateArchetype [
	"Update the support files of the book from the archetype it was created from (pillar updateArchetype)."

	^ self updateArchetypeNamed: self installedArchetypeName
]

{ #category : 'archetypes' }
PRProject >> updateArchetypeNamed: archetypeName [
	"Update the support files of the book from the archetype archetypeName (pillar updateArchetype name), and answer what changed."

	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype validateExists.
	^ archetype updateIn: self baseDirectory
]

{ #category : 'as yet unclassified' }
PRProject >> updateBuild [
	| destination reference |
	reference := FileLocator imageDirectory parent / 'archetypes'.
	destination := FileLocator imageDirectory / 'archetypes'.
	
	destination ensureDeleteAll.

	"Because we copy the archetypes folder from parent into build/archetypes"
	reference copyAllTo: destination
]

{ #category : 'actions' }
PRProject >> wipeout [
	
	self outputDirectory ensureDeleteAll
]
