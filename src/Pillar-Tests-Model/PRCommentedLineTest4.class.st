Class {
	#name : #PRCommentedLineTest4,
	#superclass : #PRTextTest4,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRCommentedLineTest4 >> actualClass [
	^ PRCommentedLine
]

{ #category : #'tests-parsing' }
PRCommentedLineTest4 >> testParseBasic [
	| wiki text tree |
	wiki := '%some comment'.
	text := ''.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some comment');
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRCommentedLineTest4 >> testParseDontInterruptLists [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '#item one' , nLine , '##item one-point-one' , nLine , '%comment' , nLine , '##item one-point-two'.
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
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRCommentedLineTest4 >> testParseDontParseContent [
	| wiki text tree |
	wiki := '%some *comment*'.
	text := ''.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some *comment*');
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	self textWriterAssertTree: tree equalsText: text
]
