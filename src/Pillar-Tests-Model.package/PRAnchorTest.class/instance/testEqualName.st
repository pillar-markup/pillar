tests-comparing
testEqualName
	self deny: (self actualClass named: 'foo') = (self actualClass named: 'bar')