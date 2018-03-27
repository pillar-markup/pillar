tests
testOrderedList
	| item |
	item := PROrderedList new
		add: (self addText: '1' to: PRListItem new);
		yourself.
	self assert: (self write: item) isEmpty