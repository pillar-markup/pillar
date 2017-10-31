tests-accessing
testCount
	self instance add: (PRTableRow new add: PRTableCell new; yourself).
	self assert: self instance rowCount = 1; assert: self instance columnCount = 1.

	self instance add: (PRTableRow new add: PRTableCell new; add: PRTableCell new; yourself).
	self assert: self instance rowCount = 2; assert: self instance columnCount = 2.

	self instance add: (PRTableRow new add: PRTableCell new; yourself).
	self assert: self instance rowCount = 3; assert: self instance columnCount = 2