tests-accessing
testCount
	self instance add: PRTableCell new.
	self assert: self instance columnCount = 1.

	self instance add: PRTableCell new.
	self assert: self instance columnCount = 2