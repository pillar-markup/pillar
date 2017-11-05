helpers
parse: anObject startingAt: aRule
	^ (self class newStartingAt: aRule) parse: anObject