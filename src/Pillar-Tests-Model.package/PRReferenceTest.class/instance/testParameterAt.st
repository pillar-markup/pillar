tests-parameters
testParameterAt
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifAbsent: [nil]) = 'bar'.
	self assert: (self instance parameters at: 'bar' ifAbsent: [nil]) isNil