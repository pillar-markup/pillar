accessing
annotatedParagraph
	^ super annotatedParagraph token
	==> [ :t | 
		self commands add: (GTNoteHighlightingCommand new 
			start: t start;
			stop: t stop) ]