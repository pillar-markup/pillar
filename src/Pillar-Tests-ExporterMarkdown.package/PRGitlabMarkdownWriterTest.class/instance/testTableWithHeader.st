tests
testTableWithHeader
	| item |
	item := PRDocument new
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell align: nil heading: false withAll: {PRText content: 'foo'}))).
	self assertWriting: item includesText: '| foo |'.
	self assertWriting: item includesText: '| --- |'