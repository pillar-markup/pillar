Class {
	#name : #PRCommentedLineTest3,
	#superclass : #PRTextTest3,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRCommentedLineTest3 >> actualClass [
	^ PRCommentedLine
]

{ #category : #'tests-parsing' }
PRCommentedLineTest3 >> testParseBasic [
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
PRCommentedLineTest3 >> testParseDontInterruptLists [
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
PRCommentedLineTest3 >> testParseDontParseContent [
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
