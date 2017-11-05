tests
testCommentedLineNotVisibleInOutput
	| item result |
	item := PRCommentedLine content: 'some comment'.
	result := self write: item.
	self assert: result isEmpty.