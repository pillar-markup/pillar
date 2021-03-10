Class {
	#name : #PRPillarWriterCommentedLineTest,
	#superclass : #PRPillarWriterTextTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #private }
PRPillarWriterCommentedLineTest >> actualClass [
	^ PRCommentedLine
]

{ #category : #'tests-parsing' }
PRPillarWriterCommentedLineTest >> testParseBasic [
	| wiki text tree |
	wiki := '%some comment'.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some comment');
		yourself.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #'tests-parsing' }
PRPillarWriterCommentedLineTest >> testParseDontInterruptLists [
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
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.

]

{ #category : #'tests-parsing' }
PRPillarWriterCommentedLineTest >> testParseDontParseContent [
	| wiki tree |
	wiki := '%some *comment*'.
	
	tree := PRDocument new
		add: (PRCommentedLine content: 'some *comment*');
		yourself.
	
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
