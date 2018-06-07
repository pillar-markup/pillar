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

	aProject contributeToPipelineBuilding: self.

	(self filesToBuildOn: aProject) do: [ :each |
		(self documentFor: each) buildOn: aProject ]
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
	self buildAll.
]

{ #category : #preparation }
PRTarget >> prepareForExecutionOn: aPRProject [ 
	
	self subclassResponsibility
]

{ #category : #accessing }
PRTarget >> transformations [
	
	^ transformations
]
