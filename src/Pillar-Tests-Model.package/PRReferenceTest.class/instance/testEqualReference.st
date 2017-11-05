tests-comparing
testEqualReference
	self deny: (self actualClass new reference: 'foo'; yourself) = (self actualClass new reference: 'bar'; yourself)