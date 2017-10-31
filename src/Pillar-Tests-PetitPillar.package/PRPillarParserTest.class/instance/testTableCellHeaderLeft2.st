tests - Table
testTableCellHeaderLeft2
	super testTableCellHeaderLeft2.
	self assert: result equals: (PRTableCell align: #left heading: true withAll: {PRText content: 'Foo'})