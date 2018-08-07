tests - Header
testHeaderEmpty
	super testHeaderEmpty.
	self assert: result equals: (PRHeader withAll: Array new level: 1)