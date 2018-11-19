Class {
	#name : #PRSlideTest,
	#superclass : #PRDocumentGroupTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRSlideTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRSlideTest >> actualClass [
	^ PRSlide
]

{ #category : #tests }
PRSlideTest >> testHaveTitle [
	| slide |
	slide := self actualClass titled: 'Foo'.
	self assert: slide title equals: 'Foo'
]
