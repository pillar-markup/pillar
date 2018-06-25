tests - Paragraph
testAnnotatedParagraphEmpty
	super testAnnotatedParagraphEmpty.
	self
		assert: result
		equals:
			(PRAnnotatedParagraph new
				annotation: 'foo';
				yourself)