tests
testSizeWhenNumeratingIsFalse
	| headerConfig |
	headerConfig := PRTitleConfiguration with: ( Dictionary with: 'numbering' -> false with: 'size' -> 0).
	self assert: (headerConfig size) equals: 0.
	
	headerConfig := PRTitleConfiguration with: ( Dictionary with: 'numbering' -> false with: 'size' -> 3).
	self assert: (headerConfig size) equals: 0