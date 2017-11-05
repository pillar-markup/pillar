tests-parameters
testHasParameter
	self instance parameters: (Dictionary with: 'foo' -> 'zork' with: 'bar' -> nil).
	self assert: (self instance hasParameter: 'foo').
	self assert: (self instance hasParameter: 'bar').
	self deny: (self instance hasParameter: 'zork')