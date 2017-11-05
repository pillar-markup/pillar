accessing
header
	^ super header token
	==> [ :t | 
		self commands add: (GTHeadingHighlightingCommand new 
				start: t start;
				stop: t stop) ]