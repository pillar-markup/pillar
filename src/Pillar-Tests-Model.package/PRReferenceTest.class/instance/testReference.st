tests-accessing
testReference
	self instance reference: 'zork'.
	self assert: self instance reference = 'zork'