tests
testScript
	| item |
	item := PRCodeblock content: 'foo'.
	self assert: (self write: item) isEmpty