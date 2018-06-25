tests - Table
testTableRow
	super testTableRow.
	self
		assert: result
		equals:
			(PRTableRow new
				add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo'});
				add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Bar'});
				yourself)