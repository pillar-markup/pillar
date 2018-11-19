Class {
	#name : #PRCitationTest,
	#superclass : #PRDocumentItemTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #'as yet unclassified' }
PRCitationTest class >> isAbstract [
	^false
]

{ #category : #private }
PRCitationTest >> actualClass [
	^ PRCitation 
]

{ #category : #tests }
PRCitationTest >> testHaveRef [

	|citation|
	citation := self actualClass ref: 'foo'.
	self assert: citation ref equals: 'foo'
]
