tests-accessing
testSize
	self assert: self instance size = 0.
	self instance add: self fooInstance.
	self assert: self instance size = 1