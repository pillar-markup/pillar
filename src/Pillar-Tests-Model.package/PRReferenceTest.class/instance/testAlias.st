tests
testAlias
	self deny: self instance hasAlias.

	self instance add: self fooInstance.
	self assert: self instance hasAlias.
	self assert: self instance alias = 'foo'.

	self instance add: self barInstance.
	self assert: self instance hasAlias.
	self assert: self instance alias = 'foobar'