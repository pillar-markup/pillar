tests-accessing
testRowWithHeadingCellIsHeading
	self instance
		add:
			(self
				addText: 'foo'
				to:
					(PRTableCell new
						beHeading;
						yourself)).
	self assert: self instance isHeading