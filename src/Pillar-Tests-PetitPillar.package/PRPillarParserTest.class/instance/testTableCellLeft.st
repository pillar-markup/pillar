tests - Table
testTableCellLeft
	super testTableCellLeft.
	self assert: result equals: (PRTableCell align: #left heading: false withAll: {PRText content: 'Foo'})