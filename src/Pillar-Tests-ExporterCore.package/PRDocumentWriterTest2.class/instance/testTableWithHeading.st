tests
testTableWithHeading
	| item |
	item := PRTable new
		add:
				(PRTableRow new
						add:
								(self
										addText: 'foo'
										to:
											(PRTableCell new
												beHeading;
												yourself));
						yourself);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self tableBegin).
			(self tableRow).
			(self tableCellWithHeadingFoo)}