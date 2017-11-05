tests-instantiation
testContent
	instance := self actualClass content: 'zork'.
	self assert: self instance text = 'zork'