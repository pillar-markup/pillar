tests
testTableWith2CellsInARow
	| item |
	item := super testTableWith2CellsInARow.
	self assertWriting: item includesText: 'foo & foo \\'
	