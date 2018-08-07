grammar - Paragraph
annotatedParagraph
	^ super annotatedParagraph
		==> [ :array | 
				(PRAnnotatedParagraph 
					withAll: (array fourth
						ifNil: [ {} ] 
						ifNotNil: [ :elem | elem second ]) 
					annotation: array third)
						start: array first start;
						stop: array last stop ]