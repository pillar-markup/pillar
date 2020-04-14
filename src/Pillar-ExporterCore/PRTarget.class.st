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
	
	^ self buildClapCommandWithId: self clapId withPositionals: true
]

{ #category : #clap }
PRTarget class >> buildClapCommandWithId: anId withPositionals: isWithPositionals [
	
	| target project command |
	target := self new.
	project := self newProject.
 
	command := (ClapCommand id: anId asSymbol)
		description: 'Build your Pillar documents in ', self clapId asString ,' format';
		add: ClapFlag forHelp;
		add: ((ClapFlag id: #templatable)
				description: 'Use a template');
				meaning: [project beTemplatable];
		add: ((ClapFlag id: #all)
				description: 'Build all Pillar documents in repository';
				canonicalName: 'a';
				meaning: [ PRBuildAllStrategy new ]);
		add: ((ClapFlag id: #mainRoot)
				description: 'Build index.pillar in root directory';
				canonicalName: 'm';
				meaning: [ PRBuildRootMainStrategy new ]); yourself.
				
		isWithPositionals ifTrue: [ command := command add: ((ClapPositional id: #requestedFiles)
				description: 'Pillar files you want to build';
				multiple: true;
				meaning: [ :doc | doc word asFileReference ]); yourself ].
		
		command := command meaning: [ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			args at: #templatable ifPresent: [(args at: #templatable) value ].
			"here, default strategy is mainRoot and the following order give strategies a priority order"
			isWithPositionals ifTrue: [ 
			(args at: #requestedFiles ) isExplicit ifTrue:[ 
				target buildStrategy: (PRBuildListStrategy list: (args occurrencesOf: #requestedFiles collect: #value) )
				] ].
			args at: #all ifPresent: [ :strat | target buildStrategy: strat value ].
			args at: #mainRoot ifPresent: [ :strat | target buildStrategy: strat value].
			
			target buildWithClapArguments: project ]
		
		yourself.
		
		^ command.
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

{ #category : #'clap-integration' }
PRTarget class >> newProject [

	^ PRProject on: FileSystem workingDirectory
]

{ #category : #accessing }
PRTarget class >> targetByFormatName: aFormat [
	^ self allSubclasses
		detect: [ :each | (each isAbstract not) and: [each builderName asString = aFormat asString] ] ifNone: [ ^ PRInvalidTarget ]
]

{ #category : #accessing }
PRTarget >> addPillarDocumentTransformation: aTransformation [
	
	transformations add: aTransformation
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

{ #category : #accessing }
PRTarget >> buildStrategy: aStrategy [
	buildStrategy := aStrategy
]

{ #category : #'clap-integration' }
PRTarget >> buildWithClapArguments: project [

	(project build: self) exitProcess
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
	buildStrategy := PRBuildRootMainStrategy new.
]

{ #category : #preparation }
PRTarget >> prepareForExecutionOn: aPRProject [ 
	
	self subclassResponsibility
]

{ #category : #accessing }
PRTarget >> transformations [
	
	^ transformations
]
