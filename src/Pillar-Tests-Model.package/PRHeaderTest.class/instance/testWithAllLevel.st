tests-instantiation
testWithAllLevel
	instance := self actualClass withAll: self foobarInstances level: 3.
	self assert: self instance children size equals: 2.
	self assert: self instance children first equals: self fooInstance.
	self assert: self instance children second equals: self barInstance.
	self assert: self instance level equals: 3