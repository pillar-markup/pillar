accessing
header
	^ super header
	==> [ :aNode | 
		self commands add: (GTHeadingHighlightingCommand new 
				start: aNode start;
				stop: aNode stop) ]