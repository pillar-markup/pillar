tests
testCounter
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman' .
	spec size: 1.
	printer level1: spec. 
	
	spec := printer printerSpecFor: 'letter' .
	spec size: 2.
	printer level2: spec. 
	
	spec := printer printerSpecFor: 'letter' .
	spec size: 3.
	printer level3: spec. 

	self assert: (printer level3 printCounter: self counterLevel3) equals: 'I.c'