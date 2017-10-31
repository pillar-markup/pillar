accessing
figure
	^ super figure 
	==> [ :tokens | 
		self commands add: (
			GTPillarFileHighlightingCommand new 
				start: tokens first start;
				stop: tokens last stop;
				fileName: tokens third) ]