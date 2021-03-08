Class {
	#name : #PRFormatTest,
	#superclass : #PRDocumentGroupTest,
	#instVars : [
		'otherClass',
		'markup'
	],
	#category : #'Pillar-Tests-Core'
}

{ #category : #private }
PRFormatTest >> actualClass [
	^ PRFormat
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
