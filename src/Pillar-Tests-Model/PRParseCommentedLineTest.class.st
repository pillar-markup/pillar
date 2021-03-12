Class {
	#name : #PRParseCommentedLineTest,
	#superclass : #PRParseTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRParseCommentedLineTest >> actualClass [
	^ PRCommentedLine
]

{ #category : #'tests-parsing' }
PRParseCommentedLineTest >> testParseBasic [
	| wiki tree |
	wiki := '%some comment'.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some comment');
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
]

{ #category : #'tests-parsing' }
PRParseCommentedLineTest >> testParseDontInterruptLists [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '#item one' , nLine , '##item one-point-one' , nLine , '%comment' , nLine , '##item one-point-two'.
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

]

{ #category : #'tests-parsing' }
PRParseCommentedLineTest >> testParseDontParseContent [
	| wiki tree |
	wiki := '%some *comment*'.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some *comment*');
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.

]
