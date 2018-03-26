tests
testSizeWhenNumeratingIsFalse
	| printer |
	printer := PRTitlePrinterSpecification with: ( Dictionary with: 'numbering' -> false with: 'size' -> 0).
	self assert: (printer size) equals: 0.
	
	printer := PRTitlePrinterSpecification with: ( Dictionary with: 'numbering' -> false with: 'size' -> 3).
	self assert: (printer size) equals: 0