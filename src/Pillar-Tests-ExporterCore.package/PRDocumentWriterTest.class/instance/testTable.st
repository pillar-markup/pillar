tests
testTable
	| item |
	item := PRTable new
		add:
				(PRTableRow new
						add: (self addText: 'foo' to: PRTableCell new);
						yourself);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self tableBegin).
			(self tableRow).
			(self tableCellWithFoo)}