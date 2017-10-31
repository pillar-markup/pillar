tests - Table
testTableCellHeaderLeft
	super testTableCellHeaderLeft.
	self assert: result equals: (PRTableCell align: #left heading: true withAll: {PRText content: 'Foo'})