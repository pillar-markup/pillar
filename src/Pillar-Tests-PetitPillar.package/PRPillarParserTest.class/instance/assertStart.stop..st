asserting
assertStart: aStartInteger stop: aStopIndex
	self assert: result notNil.
	self
		assert: result start
		equals: aStartInteger.
	self
		assert: result stop
		equals: aStopIndex.
	