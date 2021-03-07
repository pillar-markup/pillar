Class {
	#name : #PRAnchorTest4,
	#superclass : #PRPillarWriterDocumentItemTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAnchorTest4 class >> isAbstract [
	^ false
]

{ #category : #private }
PRAnchorTest4 >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-parsing' }
PRAnchorTest4 >> testBasic [
	| wiki tree |
	wiki := '@name'.
	tree := PRDocument new
		add: (PRAnchor named: 'name');
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRAnchorTest4 >> testMultiple [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '@one' , nLine , '@two' , nLine , nLine , '@tree'.
	tree := PRDocument new
		add: (PRAnchor named: 'one');
		add: (PRAnchor named: 'two');
		add: PREmptyParagraph new;
		add: (PRAnchor named: 'tree');
		yourself.

	self 
		pillarWriterAssertTree: tree
		equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRAnchorTest4 >> testSpaces [
	| wiki tree |
	wiki := '@one two'.
	tree := PRDocument new
		add: (PRAnchor named: 'one two');
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
