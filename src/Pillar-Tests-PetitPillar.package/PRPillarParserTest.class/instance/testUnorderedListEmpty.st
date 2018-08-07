tests - List
testUnorderedListEmpty
	super testUnorderedListEmpty.
	self assert: result equals: (PRUnorderedList with: PRListItem new).
	self assertStart: 1 stop: 1.