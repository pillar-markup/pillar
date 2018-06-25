tests - List
testUnorderedList
	super testUnorderedList.
	self
		assert: result
		equals: (PRUnorderedList with: (PRListItem with: (PRText content: 'Foo')))