Class {
	#name : #PRPillarWriterAnchorTest,
	#superclass : #PRPillarWriterDocumentItemTest4,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #testing }
PRPillarWriterAnchorTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarWriterAnchorTest >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-parsing' }
PRPillarWriterAnchorTest >> testBasic [
	| wiki tree |
	wiki := '@name'.
	tree := PRDocument new
		add: (PRAnchor named: 'name');
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterAnchorTest >> testMultiple [
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
PRPillarWriterAnchorTest >> testSpaces [
	| wiki tree |
	wiki := '@one two'.
	tree := PRDocument new
		add: (PRAnchor named: 'one two');
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
