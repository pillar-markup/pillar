Class {
	#name : #PRTarget,
	#superclass : #Object,
	#instVars : [
		'buildStrategy',
		'transformations'
	],
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #clap }
PRTarget class >> buildClapCommand [
	
	| target |
	target := self new.

	^ (ClapCommand id: self clapId)
		description: 'Build your Pillar documents in ', self clapId ,' format';
		add: ClapFlag forHelp;
		add: ((ClapFlag id: #templatable)
				description: 'Use a template');
		add: ((ClapFlag id: #all)
				description: 'Build all Pillar documents in repository';
				canonicalName: 'a';
				meaning: [ target buildAll ]);
		add: ((ClapFlag id: #mainRoot)
				description: 'Build index.pillar in root directory';
				canonicalName: 'm';
				meaning: [ target buildMainRoot ]);
		add: ((ClapPositional id: #requestedFiles)
				description: 'Pillar files you want to build';
				multiple: true;
				meaning: [ :arg | target addFile: arg ]);
		meaning: [ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			target buildWithClapArguments: args ]
		yourself
]

{ #category : #accessing }
PRTarget class >> builderClassForName: aString [ 
	
	| builders |
	builders := self allSubclasses select: [ :each | 
		each isAbstract not and: [ each builderName = aString ] ].
	builders size > 1 ifTrue: [ 
		self error: 'There is more than one builder class for name: ', aString ].
	^ builders anyOne
]

{ #category : #accessing }
PRTarget class >> builderForName: aString [ 
	
	^ (self builderClassForName: aString) new
]

{ #category : #accessing }
PRTarget class >> builderName [
	
	^ self subclassResponsibility
]

{ #category : #clap }
PRTarget class >> clapCommandList [
	^ self allSubclasses
		select: [ :each | each isAbstract not ]
		thenCollect: [ :each | each buildClapCommand ]
]

{ #category : #clap }
PRTarget class >> clapId [
	
	^ self builderName 
]

{ #category : #testing }
PRTarget class >> isAbstract [
	^ self == PRTarget
]

{ #category : #accessing }
PRTarget >> addPillarDocumentTransformation: aTransformation [
	
	transformations add: aTransformation
]

{ #category : #building }
PRTarget >> buildAll [

	buildStrategy := PRBuildAllStrategy new
]

{ #category : #building }
PRTarget >> buildMainRoot [
	"To compile only the pillar file that can be found on the top-level."
	
	buildStrategy := PRBuildRootMainStrategy new
]

{ #category : #building }
PRTarget >> buildOn: aProject [
	"Set the pipeline and execute it for each file of the project."
	| status |
	status := PRSuccess new.
	
	"Set the pipeline"
	aProject contributeToPipelineBuilding: self.
	
	"For each file, we execute the pipeline"
	(self filesToBuildOn: aProject) do: [ :each |
		status := status and: ((self documentFor: each) buildOn: aProject) ].

	^ status
]

{ #category : #building }
PRTarget >> buildOnly: aListOfFileReferences [

	buildStrategy := PRBuildListStrategy list: aListOfFileReferences
]

{ #category : #'clap-integration' }
PRTarget >> buildWithClapArguments: clapArguments [

	(self newProject build: self) exitProcess
]

{ #category : #building }
PRTarget >> documentFor: aFile [

	self subclassResponsibility
]

{ #category : #building }
PRTarget >> filesToBuildOn: aPRProject [ 
	
	^ buildStrategy filesToBuildOn: aPRProject
]

{ #category : #initialization }
PRTarget >> initialize [
	super initialize.
	transformations := Set new.
	"self buildAll"
	self buildMainRoot 
]

{ #category : #'clap-integration' }
PRTarget >> newProject [

	^ PRProject on: FileSystem workingDirectory
]

{ #category : #preparation }
PRTarget >> prepareForExecutionOn: aPRProject [ 
	
	self subclassResponsibility
]

{ #category : #accessing }
PRTarget >> transformations [
	
	^ transformations
]
