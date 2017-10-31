tests - List
testOrderedList
	super testOrderedList.
	self assert: result equals: (PROrderedList with: (PRListItem with: (PRText content: 'Foo')))