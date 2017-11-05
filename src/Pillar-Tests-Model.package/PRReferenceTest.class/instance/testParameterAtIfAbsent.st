tests-parameters
testParameterAtIfAbsent
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifAbsent: [ 'zork' ]) = 'bar'.
	self assert: (self instance parameters at: 'bar'  ifAbsent: [ 'zork' ]) = 'zork'