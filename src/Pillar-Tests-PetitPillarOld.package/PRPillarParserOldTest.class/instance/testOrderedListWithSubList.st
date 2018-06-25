tests - List
testOrderedListWithSubList
	super testOrderedListWithSubList.
	self
		assert: result
		equals:
			(PROrderedList
				with:
					(PRListItem
						withAll:
							{PRText content: 'Foo'.
							PROrderedList with: (PRListItem with: (PRText content: 'Bar'))}))