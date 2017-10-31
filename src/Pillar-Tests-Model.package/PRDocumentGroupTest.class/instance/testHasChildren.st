tests-testing
testHasChildren
	self deny: self instance hasChildren.
	self instance add: self fooInstance.
	self assert: self instance hasChildren