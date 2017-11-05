tests-comparing
testEqualLevel
	self deny: (self actualClass new level: 1) = (self actualClass new level: 2)