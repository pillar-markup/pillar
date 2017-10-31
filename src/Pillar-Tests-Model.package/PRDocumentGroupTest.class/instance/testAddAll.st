tests-adding
testAddAll
	self instance addAll: self foobarInstances.
	self assert: self instance children size = 2.
	self assert: self instance children first = self fooInstance.
	self assert: self instance children second = self barInstance