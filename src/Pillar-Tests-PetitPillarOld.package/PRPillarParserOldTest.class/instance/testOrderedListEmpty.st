tests - List
testOrderedListEmpty
	super testOrderedListEmpty.
	self assert: result equals: (PROrderedList with: PRListItem new)