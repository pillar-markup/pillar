tests - Paragraph
testAnnotatedParagraphEmpty
	super testAnnotatedParagraphEmpty.
	self
		assert: result
		equals:
			(PRAnnotatedParagraph new
				annotation: 'foo';
				yourself).
	self assertStart: 1 stop: 5.