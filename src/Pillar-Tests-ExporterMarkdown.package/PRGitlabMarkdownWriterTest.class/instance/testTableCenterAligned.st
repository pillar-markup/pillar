tests
testTableCenterAligned
	| item alignment |
	alignment := #center.
	item := PRDocument new
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell align: alignment heading: true withAll: {PRText content: 'foo'}))).
	self assertWriting: item includesText: '| :---: |'