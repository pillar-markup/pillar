tests - Paragraph
testAnnotatedParagraphEmptyWithNewLine
	super testAnnotatedParagraphEmptyWithNewLine.
	self
		assert: result
		equals:
			(PRAnnotatedParagraph new
				annotation: 'foo';
				yourself)