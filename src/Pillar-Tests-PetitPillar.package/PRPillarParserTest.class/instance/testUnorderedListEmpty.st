tests - List
testUnorderedListEmpty
	super testUnorderedListEmpty.
	self assert: result equals: (PRUnorderedList with: PRListItem new)