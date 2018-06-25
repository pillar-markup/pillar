tests - Table
testTableCellAreTrimed
	super testTableCellAreTrimed.
	self assert: result equals: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo'})