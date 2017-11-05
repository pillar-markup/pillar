tests-parameters
testParameterAtPut
	self assert: (self instance parameters at: 'foo' put: 'bar') = 'bar'.
	self assert: (self instance parameters size = 1).
	self assert: (self instance parameters keys first = 'foo').
	self assert: (self instance parameters values first = 'bar').

	self assert: (self instance parameters at: 'foo' put: 'zork') = 'zork'.
	self assert: (self instance parameters size = 1).
	self assert: (self instance parameters keys first = 'foo').
	self assert: (self instance parameters values first = 'zork')