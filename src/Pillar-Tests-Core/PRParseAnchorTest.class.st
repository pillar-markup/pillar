Class {
	#name : #PRParseAnchorTest,
	#superclass : #PRParseDocumentItemTest2,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRParseAnchorTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseAnchorTest >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-parsing' }
PRParseAnchorTest >> testBasic [
	| wiki tree |
	wiki := '@name'.
	tree := PRDocument new add: (PRAnchor named: 'name'); yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseAnchorTest >> testMultiple [
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
PRParseAnchorTest >> testSpaces [
	| wiki tree |
	wiki := '@one two'.
	tree := PRDocument new add: (PRAnchor named: 'one two'); yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]
