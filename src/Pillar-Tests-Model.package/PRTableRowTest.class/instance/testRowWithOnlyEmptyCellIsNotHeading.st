tests-accessing
testRowWithOnlyEmptyCellIsNotHeading
	self instance
		add: PRTableCell new;
		add: PRTableCell new.
	self deny: self instance isHeading