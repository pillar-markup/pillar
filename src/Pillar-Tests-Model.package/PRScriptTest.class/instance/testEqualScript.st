tests
testEqualScript
	self deny: (self actualClass content: 'foo') equals: (self actualClass content: 'bar').
	self assert: (self actualClass content: 'foo') equals: (self actualClass content: 'foo')