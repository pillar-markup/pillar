tests - Paragraph
testParagraph
	super testParagraph.
	self assert: result equals: (PRParagraph new add: (PRText content: 'This is a text'))