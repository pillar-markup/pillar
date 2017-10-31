tests-accessing
testRowWithHeadingCellsAndOneEmptyCellIsHeading
	self instance
		add:
				(self
						addText: 'foo'
						to:
							(PRTableCell new
								beHeading;
								yourself));
		add: PRTableCell new.
	self assert: self instance isHeading