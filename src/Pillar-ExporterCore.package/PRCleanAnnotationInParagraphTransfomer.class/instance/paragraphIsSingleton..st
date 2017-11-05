testing
paragraphIsSingleton: aParagraph
	^ aParagraph children size = 1
		or: [ self paragraphJustContainsALineBreakMore: aParagraph ]