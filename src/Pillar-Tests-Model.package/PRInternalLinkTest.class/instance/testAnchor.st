tests-accessing
testAnchor
	self instance anchor: 'zork'.
	self assert: self instance anchor = 'zork'.
	self assert: self instance hasAnchor