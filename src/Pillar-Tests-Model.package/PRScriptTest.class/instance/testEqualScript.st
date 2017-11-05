tests
testEqualScript
	self deny: (self actualClass content: 'foo') = (self actualClass content: 'bar').
	self assert: (self actualClass content: 'foo') = (self actualClass content: 'foo')