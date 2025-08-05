Class {
	#name : 'PRTarget',
	#superclass : 'Object',
	#instVars : [
		'buildStrategy',
		'transformations'
	],
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'accessing' }
PRTarget class >> builderClassForName: aString [ 
	
	| builders |
	builders := self allSubclasses select: [ :each | 
		each isAbstract not and: [ each builderName = aString ] ].
	builders size > 1 ifTrue: [ 
		self error: 'There is more than one builder class for name: ', aString ].
	^ builders anyOne
]

{ #category : 'accessing' }
PRTarget class >> builderForName: aString [ 
	
	^ (self builderClassForName: aString) new
]

{ #category : 'accessing' }
PRTarget class >> builderName [
	
	^ self subclassResponsibility
]

{ #category : 'testing' }
PRTarget class >> isAbstract [
	^ self == PRTarget
]

{ #category : 'clap-integration' }
PRTarget class >> newProject [

	^ PRProject on: FileSystem workingDirectory
]

{ #category : 'accessing' }
PRTarget class >> targetByFormatName: aFormat [
	^ self allSubclasses
		detect: [ :each | (each isAbstract not) and: [each builderName asString = aFormat asString] ] ifNone: [ ^ PRInvalidTarget ]
]

{ #category : 'accessing' }
PRTarget >> addPillarDocumentTransformation: aTransformation [
	
	transformations add: aTransformation
]

{ #category : 'building' }
PRTarget >> allFilesStrategy [

	self buildStrategy: PRBuildAllStrategy new
]

{ #category : 'building' }
PRTarget >> buildOn: aProject [
	"Set the pipeline and execute it for each file of the project."
	| status |
	status := PRSuccess new.
	
	"Set the pipeline"
	aProject contributeToPipelineBuilding: self.
	"For each file, we execute the pipeline"
	(self filesToBuildOn: aProject) do: [ :each |
		each file exists ifTrue: [ 
			status := status and: ((self documentFor: each) buildOn: aProject) ]
		"I do not know how to report if a file does not exist. 
		May be producing a failure is not adequate."
	].

	^ status
]

{ #category : 'accessing' }
PRTarget >> buildStrategy: aStrategy [
	buildStrategy := aStrategy
]

{ #category : 'clap-integration' }
PRTarget >> buildWithClapArguments: project [

	(project build: self) exitProcess
]

{ #category : 'building' }
PRTarget >> documentFor: aFile [

	self subclassResponsibility
]

{ #category : 'building' }
PRTarget >> explicitFilesStrategyOn: aListOfFileReferences [

	self buildStrategy: (PRBuildListStrategy list: aListOfFileReferences)
]

{ #category : 'building' }
PRTarget >> filesToBuildOn: aPRProject [ 
	
	^ buildStrategy filesToBuildOn: aPRProject
]

{ #category : 'initialization' }
PRTarget >> initialize [
	super initialize.
	transformations := Set new.
	"self buildAll"
	buildStrategy := PRBuildRootMainStrategy new.
]

{ #category : 'building' }
PRTarget >> onlyMainRootStrategy [

	self buildStrategy: PRBuildRootMainStrategy new
]

{ #category : 'preparation' }
PRTarget >> prepareForExecutionOn: aPRProject [ 
	
	self subclassResponsibility
]

{ #category : 'accessing' }
PRTarget >> transformations [
	
	^ transformations
]
