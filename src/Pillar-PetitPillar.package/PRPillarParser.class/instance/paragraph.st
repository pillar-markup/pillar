grammar - Paragraph
paragraph
	^ super paragraph ==> [ :array | 
		(PRParagraph withAll: array second)
			start: array first start;
			stop: array last stop ]