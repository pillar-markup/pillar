tests - List
testOrderedList
	super testOrderedList.
	self assert: result equals: (PROrderedList with: (PRListItem with: (PRText content: 'Foo'))).
	self assertStart: 1 stop: 4.
	self assertStart: 1 stop: 4 ofNode: result children first.
	self assertStart: 2 stop: 4 ofNode: result children first children first.