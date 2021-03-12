Class {
	#name : #PRTextWriterCommentedLineTest,
	#superclass : #PRTextWriterTextTest,
	#category : #'Pillar-Tests-Model-TextWriter'
}

{ #category : #private }
PRTextWriterCommentedLineTest >> actualClass [
	^ PRCommentedLine
]

{ #category : #'tests-parsing' }
PRTextWriterCommentedLineTest >> testParseBasic [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some comment');
		yourself.

	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterCommentedLineTest >> testParseDontInterruptLists [
	| text tree nLine |
	nLine := Smalltalk os lineEnding.
	text := '1. item one' , nLine , '	1. item one-point-one' , nLine , '	2. item one-point-two'.
	tree := PRDocument new
		add:
				(PROrderedList new
						add:
								(PRListItem new
										add: (PRText content: 'item one');
										add:
												(PROrderedList new
														add:
																(PRListItem new
																		add: (PRText content: 'item one-point-one');
																		add: (PRCommentedLine content: 'comment');
																		yourself);
														add:
																(PRListItem new
																		add: (PRText content: 'item one-point-two');
																		yourself);
														yourself);
										yourself);
						yourself);
		yourself.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRTextWriterCommentedLineTest >> testParseDontParseContent [
	| text tree |
	text := ''.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some *comment*');
		yourself.

	self textWriterAssertTree: tree equalsText: text
]
