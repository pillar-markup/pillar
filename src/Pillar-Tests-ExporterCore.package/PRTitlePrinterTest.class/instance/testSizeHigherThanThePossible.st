tests
testSizeHigherThanThePossible
	
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman'.
	spec size: 1.
	printer level1: spec. 	
		
	spec := printer printerSpecFor: 'number' .
	spec size: 2.
	printer level1: spec. 	
		
	self assert: (printer level2 printCounter: #(-1 1)) equals: '1'