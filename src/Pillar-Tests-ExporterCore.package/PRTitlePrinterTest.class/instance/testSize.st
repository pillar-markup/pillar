tests
testSize
	| printer spec |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman' .
	spec size: 1.
	printer level1: spec. 
	
	spec := printer printerSpecFor: 'number' .
	
	spec size: 0.
	printer level2: spec. 
	
	spec := printer printerSpecFor: 'letter' .
	spec size: 3.
	printer level3: spec. 

	self assert: (printer level3 printCounter: #(1 -1 1)) equals: 'I.a'.

	printer level2 size: 2.
	
	self assert: (printer level3 printCounter: #(1 1 1)) equals: 'I.1.a'
	