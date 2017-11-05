tests-accessing
testText
	self instance text: 'zork'.
	self assert: self instance text = 'zork'