Class {
	#name : #PRFigureTest,
	#superclass : #PRReferenceTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRFigureTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRFigureTest >> actualClass [
	^ PRFigure
]

{ #category : #private }
PRFigureTest >> markup [
	^ PRPillarParser markups at: PRFigure
]

{ #category : #private }
PRFigureTest >> referenceString [
	^ 'file://test.png'
]

{ #category : #tests }
PRFigureTest >> testHasCaption [
	self deny: PRFigure new hasCaption.
	self assert: (self addText: 'foo' to: PRFigure new) hasCaption
]
