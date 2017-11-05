tests-comparing
testEqualAnchor
	self deny: (self actualClass new anchor: 'foo'; yourself) = ((self actualClass new) anchor: 'bar'; yourself)