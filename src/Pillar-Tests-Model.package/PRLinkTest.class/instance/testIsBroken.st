tests
testIsBroken
	self assert: (self instance isBroken or: [ self instance isBroken not ])