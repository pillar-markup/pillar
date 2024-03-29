Class {
	#name : #PRTextWriterAnchorTest,
	#superclass : #PRTextWriterDocumentItemTest,
	#category : #'Pillar-Tests-ExporterText'
}

{ #category : #testing }
PRTextWriterAnchorTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRTextWriterAnchorTest >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-parsing' }
PRTextWriterAnchorTest >> testBasic [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'name');
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterAnchorTest >> testMultiple [

	| text tree nLine |
	nLine := self lineEnding.
	text := ''.
	tree := PRDocument new
		        add: (PRAnchor named: 'one');
		        add: (PRAnchor named: 'two');
		        add: PREmptyParagraph new;
		        add: (PRAnchor named: 'tree');
		        yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterAnchorTest >> testSpaces [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one two');
		yourself.
	self textWriterAssertTree: tree equalsText: text
]
