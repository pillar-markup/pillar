Class {
	#name : #PRTarget,
	#superclass : #Object,
	#instVars : [
		'buildStrategy',
		'transformations'
	],
	#category : 'Pillar-ExporterCore-Base'
}

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
	self buildAll
]

{ #category : #preparation }
PRTarget >> prepareForExecutionOn: aPRProject [ 
	
	self subclassResponsibility
]

{ #category : #accessing }
PRTarget >> transformations [
	
	^ transformations
]
