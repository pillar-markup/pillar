grammar - Paragraph
annotatedParagraph
	^ super annotatedParagraph
		==> [ :array | PRAnnotatedParagraph withAll: (array third ifNil: [ {} ] ifNotNil: [ :elem | elem second ]) annotation: array second ]