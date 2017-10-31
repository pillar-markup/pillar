testing
paragraphJustContainsALineBreakMore: aParagraph
	^ aParagraph children size = 2
		and: [ aParagraph children second isKindOf: PRLineBreak ]