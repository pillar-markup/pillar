tests
testIsValidCounter
	self assert: (PRCascadingCounter maxLevel: 5) isValidCounter.
	self deny: (PRNotFoundCounter maxLevel: 5) isValidCounter