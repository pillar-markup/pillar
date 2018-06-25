tests - Table
testTableCellHeader
	super testTableCellHeader.
	self assert: result equals: (PRTableCell align: nil heading: true withAll: {PRText content: 'Foo'})