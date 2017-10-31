tests - Table
testTableCellCenter
	super testTableCellCenter.
	self assert: result equals: (PRTableCell align: #center heading: false withAll: {PRText content: 'Foo'})