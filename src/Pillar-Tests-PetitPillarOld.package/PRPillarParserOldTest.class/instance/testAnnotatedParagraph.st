tests - Paragraph
testAnnotatedParagraph
	super testAnnotatedParagraph.
	self assert: result equals: (PRAnnotatedParagraph withAll: {PRText content: 'Bar'} annotation: 'foo')