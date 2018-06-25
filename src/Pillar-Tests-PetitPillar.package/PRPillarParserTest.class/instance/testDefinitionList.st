tests - List
testDefinitionList
	super testDefinitionList.
	self
		assert: result
		equals:
			(PRDefinitionList
				withAll:
					{(PRTermItem with: (PRText content: 'Foo')).
					(PRDataItem with: (PRText content: 'Bar'))}).
	self assertStart: 1 stop: 9.
	self assertStart: 1 stop: 5 ofNode: result children first.
	self assertStart: 2 stop: 4 ofNode: result children first children first.
	self assertStart: 6 stop: 9 ofNode: result children second.
	self assertStart: 7 stop: 9 ofNode: result children second children first.
	