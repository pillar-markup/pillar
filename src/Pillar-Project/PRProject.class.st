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
	#name : #PRProject,
	#superclass : #PRObject,
	#instVars : [
		'baseDirectory',
		'templatable'
	],
	#category : #'Pillar-Project-Core'
}

{ #category : #testing }
PRProject class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
PRProject class >> on: aDirectory [

	^ self new
		baseDirectory: aDirectory;
		yourself
]

{ #category : #accessing }
PRProject class >> pathToString: aPath [
	^ aPath pillarPrintString
]

{ #category : #archetypes }
PRProject >> archetypeNamed: aString [ 
	
	^ PRArchetype new
		name: aString;
		project: self;
		yourself
]

{ #category : #accessing }
PRProject >> baseDirectory [
	^ baseDirectory
]

{ #category : #accessing }
PRProject >> baseDirectory: aFileReference [ 
	baseDirectory := aFileReference
]

{ #category : #templates }
PRProject >> beTemplatable [

	templatable := true
]

{ #category : #building }
PRProject >> build: output [
	"Output is an instance of subclass of PRTarget"
	
	"set up information required prior to pipeline building"
	self prepareForTarget: output.
	
	"Build the pipeline and execute it on each file of the project"
	^ output buildOn: self
]

{ #category : #accessing }
PRProject >> configuration [
	
	| readConfiguration extension |
	extension := Dictionary new.
	extension at: 'outputDirectory' put: self defaultOutputDirectoryName.
	
	"Just for backwards compatibility"
	extension at: '_project' put: self.

	readConfiguration := self configurationFileReference exists
		ifFalse: [ ConfigurationForPillar newFromDictionary: extension ]
		ifTrue: [ ConfigurationForPillar newFromFile: self configurationFileReference extendedWith: extension ].
	^ readConfiguration
]

{ #category : #accessing }
PRProject >> configurationFileReference [
	
	^ self baseDirectory / 'pillar.conf'
]

{ #category : #building }
PRProject >> contributeToPipelineBuilding: aPRPipelineBuilder [ 
	
	self plugins do: [ :each | each contributeToPipelineBuilding: aPRPipelineBuilder ]
]

{ #category : #accessing }
PRProject >> defaultOutputDirectoryName [
	^ '_result'
]

{ #category : #accessing }
PRProject >> defaultTarget [
	| defaultExport |
	defaultExport := [self configuration defaultExport ifEmpty: [ ^ PRAbsentTarget]] ifError: [ ^ PRAbsentTarget ]  .
	^ PRTarget targetByFormatName: defaultExport
]

{ #category : #initialization }
PRProject >> initialize [

	super initialize.
	templatable := false
]

{ #category : #archetypes }
PRProject >> installArchetypeNamed: archetypeName [
	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype validateExists.
	archetype installIn: self baseDirectory
]

{ #category : #archetypes }
PRProject >> installArchetypeNamed: archetypeName fromDirectory: pillarDirectory [
	
	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype directory: pillarDirectory.
	archetype validateExists.
	archetype installIn: self baseDirectory
]

{ #category : #templates }
PRProject >> installTemplateNamed: archetypeName [ 
	
	| archetype |
	archetype := self archetypeNamed: archetypeName.
	archetype validateExists.
	archetype installTemplateIn: self baseDirectory
]

{ #category : #templates }
PRProject >> isTemplatable [

	^ templatable
]

{ #category : #accessing }
PRProject >> outputDirectory [
	
	^ self baseDirectory resolve: self configuration outputDirectory
]

{ #category : #accessing }
PRProject >> plugins [
	
	^ (self configuration propertyAt: #plugins ifAbsent: [ #() ])
			collect: [ :each | | plugin |
				plugin := Smalltalk globals
					at: each asSymbol
					ifAbsent: [ self error: 'Could not resolve plugin: ', each ].
				plugin withContext: self ]
]

{ #category : #building }
PRProject >> prepareForTarget: target [
	"We want to build a given project i.e. PDF, HTML. We are setting up the system to be built. With prepareForTarget:, the actions that will be triggered are happening before the pipeline is set and executed."
	
	target prepareForExecutionOn: self.
	self plugins do: [ :each | each prepareForExecutionOn: self ]
]

{ #category : #accessing }
PRProject >> supportDirectory [
	
	^ self baseDirectory / '_support'
]

{ #category : #accessing }
PRProject >> tableOfContents [
	| tocFilePath tocFileName inputDoc |
	tocFilePath := self configuration propertyAt: 'tocFile' ifAbsent: [ ^ PRToc new ].
	tocFileName := self class pathToString: tocFilePath.
	inputDoc := PRPillarParserMain parse: (self baseDirectory / tocFileName) contents.
	^ PRTocBuilderVisitor new
		documentSource: self baseDirectory / tocFileName;
		currentFile: tocFileName;
		inProcessFiles: (Array with: self baseDirectory / tocFileName);
		visit: inputDoc
]

{ #category : #'as yet unclassified' }
PRProject >> updateBuild [
	| destination reference |
	reference := FileLocator imageDirectory parent / 'archetypes'.
	destination := FileLocator imageDirectory / 'archetypes'.
	
	destination ensureDeleteAll.

	"Because we copy the archetypes folder from parent into build/archetypes"
	reference copyAllTo: destination
]

{ #category : #actions }
PRProject >> wipeout [
	
	self outputDirectory ensureDeleteAll
]
