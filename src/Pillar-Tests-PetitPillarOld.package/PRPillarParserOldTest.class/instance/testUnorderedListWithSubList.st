tests - List
testUnorderedListWithSubList
	super testUnorderedListWithSubList.
	self
		assert: result
		equals:
			(PRUnorderedList
				with:
					(PRListItem
						withAll:
							{(PRText content: 'Foo').
							(PRUnorderedList with: (PRListItem with: (PRText content: 'Bar')))}))