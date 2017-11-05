tests-instantiation
testWithAllLevel
	instance := self actualClass withAll: self foobarInstances level: 3.
	self assert: self instance children size = 2.
	self assert: self instance children first = self fooInstance.
	self assert: self instance children second = self barInstance.
	self assert: self instance level = 3