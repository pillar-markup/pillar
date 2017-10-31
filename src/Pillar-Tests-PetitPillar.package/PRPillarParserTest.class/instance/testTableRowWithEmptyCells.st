tests - Table
testTableRowWithEmptyCells
	super testTableRowWithEmptyCells.
	self
		assert: result
		equals:
			(PRTableRow new
				add: PRTableCell new;
				add: PRTableCell new;
				yourself)