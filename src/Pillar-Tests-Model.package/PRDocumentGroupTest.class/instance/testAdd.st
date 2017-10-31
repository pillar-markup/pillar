tests-adding
testAdd
	self instance add: self fooInstance.
	self assert: self instance children size = 1.
	self assert: self instance children first = self fooInstance.

	self instance add: self barInstance.
	self assert: self instance children size = 2.
	self assert: self instance children first = self fooInstance.
	self assert: self instance children second = self barInstance