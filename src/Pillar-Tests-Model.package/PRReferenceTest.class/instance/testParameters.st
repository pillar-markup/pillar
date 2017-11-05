tests-parameters
testParameters
	self assert: self instance parameters isEmpty.
	self instance parameters: (Array with: 'foo' -> 'bar').
	self assert: self instance parameters size = 1