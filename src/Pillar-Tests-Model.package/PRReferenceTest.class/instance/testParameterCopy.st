tests-parameters
testParameterCopy
	| copy |
	self instance parameters at: 'class' put: 'active'.
	copy := self instance copy.
	copy parameters at: 'class' put: 'inactive'.
	copy parameters at: 'foo' put: 'bar'.
	
	self assert: (self instance parameters at: 'class') = 'active'.
	self deny: (self instance hasParameter: 'foo').
	
	self assert: (copy parameters at: 'class') = 'inactive'.
	self assert: (copy parameters at: 'foo') = 'bar'