Class {
	#name : #PRAnchorTest2,
	#superclass : #PRParseDocumentItemTest2,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAnchorTest2 class >> isAbstract [
	^ false
]

{ #category : #private }
PRAnchorTest2 >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-parsing' }
PRAnchorTest2 >> testBasic [
	| wiki tree |
	wiki := '@name'.
	tree := PRDocument new add: (PRAnchor named: 'name'); yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRAnchorTest2 >> testMultiple [
	| wiki tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '@one' , nLine , '@two' , nLine , nLine , '@tree'.
	tree := PRDocument new
		add: (PRAnchor named: 'one');
		add: (PRAnchor named: 'two');
		add: PREmptyParagraph new ;
				add: (PRAnchor named: 'tree');
		yourself.
	self 
		parserAssertWiki: wiki
		equalsTree: tree.

]

{ #category : #'tests-parsing' }
PRAnchorTest2 >> testSpaces [
	| wiki tree |
	wiki := '@one two'.
	tree := PRDocument new add: (PRAnchor named: 'one two'); yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]
