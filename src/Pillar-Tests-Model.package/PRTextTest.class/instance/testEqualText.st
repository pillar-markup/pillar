tests-comparing
testEqualText
	self deny: (self actualClass content: 'foo') = (self actualClass content: 'bar')