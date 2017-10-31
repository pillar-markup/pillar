accessing
monospaceFormat
	^ super monospaceFormat token 
	==> [ :token | 
		self commands add: (GTMonospaceFormatHighlightingCommand new 
			start: token start;
			stop: token stop)]