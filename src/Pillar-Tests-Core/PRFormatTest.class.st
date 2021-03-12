Class {
	#name : #PRFormatTest,
	#superclass : #PRDocumentGroupTest,
	#instVars : [
		'otherClass',
		'markup',
		'actualClass'
	],
	#category : #'Pillar-Tests-Core-Structural'
}

{ #category : #'building suites' }
PRFormatTest class >> isAbstract [
	^ false
]

{ #category : #'building suites' }
PRFormatTest class >> testParameters [
	^ (ParametrizedTestMatrix new
			forSelector: #actualClass addOptions: PRFormat subclasses )
]

{ #category : #private }
PRFormatTest >> actualClass [
	^ actualClass 
]

{ #category : #accessing }
PRFormatTest >> actualClass: anObject [

	actualClass := anObject
]

{ #category : #accessing }
PRFormatTest >> otherClass [
	^ otherClass ifNil: [ otherClass := PRFormat allSubclasses detect: [ :each | self actualClass ~= each ] ]
]

{ #category : #running }
PRFormatTest >> setUp [

	super setUp.
	markup := PRPillarGrammar markups at: self actualClass
]
