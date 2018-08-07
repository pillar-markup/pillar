tests - Text
testCommentedLineWithNewline
	super testCommentedLineWithNewline.
	self assert: result equals: (PRCommentedLine content: 'some text')