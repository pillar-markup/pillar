accessing
figure
	^ super figure 
	==> [ :aNode | 
		self commands add: (
			GTPillarFileHighlightingCommand new 
				start: aNode start;
				stop: aNode stop;
				fileName: aNode reference) ]