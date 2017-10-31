tests-parameters
testParameterAtIfPresent
	self instance parameters: (Dictionary with: 'foo' -> 'bar').
	self assert: (self instance parameters at: 'foo' ifPresent: [ :value | '!' , value ]) = '!bar'.
	self assert: (self instance parameters at: 'bar' ifPresent: [ :value | '!' , value ]) isNil