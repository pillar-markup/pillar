tests-instantiation
testWith
	instance := self actualClass with: self fooInstance.
	self assert: instance children size = 1.
	self assert: instance children first = self fooInstance