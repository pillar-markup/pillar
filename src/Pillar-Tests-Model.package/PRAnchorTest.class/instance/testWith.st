tests-instantiation
testWith
	instance := self actualClass named: 'test'.
	self assert: self instance name = 'test'