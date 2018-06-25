tests - List
testOrderedListWithTwoItems
	super testOrderedListWithTwoItems.
	self
		assert: result
		equals:
			(PROrderedList
				withAll:
					{(PRListItem with: (PRText content: 'Foo')).
					(PRListItem with: (PRText content: 'Bar'))})