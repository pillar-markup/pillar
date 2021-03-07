Class {
	#name : #PRAnchorTest3,
	#superclass : #PRTextWriterDocumentItemTest3,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAnchorTest3 class >> isAbstract [
	^ false
]

{ #category : #private }
PRAnchorTest3 >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-parsing' }
PRAnchorTest3 >> testBasic [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'name');
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRAnchorTest3 >> testMultiple [
	| text tree nLine|
	nLine := Smalltalk os lineEnding.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one');
		add: (PRAnchor named: 'two');
		add: PREmptyParagraph new;
			add: (PRAnchor named: 'tree');
		yourself.
	self 
		textWriterAssertTree: tree
		equalsText: text
]

{ #category : #'tests-parsing' }
PRAnchorTest3 >> testSpaces [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one two');
		yourself.
	self textWriterAssertTree: tree equalsText: text
]
