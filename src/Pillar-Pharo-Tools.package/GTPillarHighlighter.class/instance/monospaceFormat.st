accessing
monospaceFormat
	^ super monospaceFormat 
	==> [ :aNode | 
		self commands add: (GTMonospaceFormatHighlightingCommand new 
			start: aNode start;
			stop: aNode stop)]