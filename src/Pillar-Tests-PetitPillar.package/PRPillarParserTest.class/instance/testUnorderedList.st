tests - List
testUnorderedList
	super testUnorderedList.
	self
		assert: result
		equals: (PRUnorderedList with: (PRListItem with: (PRText content: 'Foo'))).
	self assertStart: 1 stop: 4.
	self assertStart: 1 stop: 4 ofNode: result children first.
	self assertStart: 2 stop: 4 ofNode: result children first children first.