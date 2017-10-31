tests
testAnchor
	| item |
	item := PRAnchor new name: 'foo'.
	self assertWriting: item includesText: 'id="foo"'