tests
testAnchor
	| item |
	item := PRAnchor new name: 'foo'.
	self assertWriting: item includesText: '\label{foo}'