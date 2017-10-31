tests-instantiation
testWithAll
	instance := self actualClass withAll: self foobarInstances.
	self assert: instance children size = 2.
	self assert: instance children first = self fooInstance.
	self assert: instance children second = self barInstance