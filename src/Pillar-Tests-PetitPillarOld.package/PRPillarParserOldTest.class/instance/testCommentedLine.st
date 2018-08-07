tests - Text
testCommentedLine
	super testCommentedLine.
	self assert: result equals: (PRCommentedLine content: 'some text')