accessing
annotatedParagraph
	^ super annotatedParagraph
	==> [ :aNode | 
		self commands add: (GTNoteHighlightingCommand new 
			start: aNode start;
			stop: aNode stop) ]