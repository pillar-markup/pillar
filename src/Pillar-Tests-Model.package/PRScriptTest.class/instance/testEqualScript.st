tests
testEqualScript
	self assert: (self actualClass content: 'foo')  ~= (self actualClass content: 'bar').
	self assert: (self actualClass content: 'foo') equals: (self actualClass content: 'foo')