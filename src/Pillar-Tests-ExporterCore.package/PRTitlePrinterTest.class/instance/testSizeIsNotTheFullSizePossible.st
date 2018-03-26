tests
testSizeIsNotTheFullSizePossible
	
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman'.
	spec size: 1.
	printer level1: spec. 	
		
	spec := printer printerSpecFor: 'number' .
	spec size: 1.
	printer level2: spec. 	
		
	self assert: (printer level1 printCounter: #(1)) equals: 'I'.
	self assert: (printer level2 printCounter: #(1 1)) equals: '1'