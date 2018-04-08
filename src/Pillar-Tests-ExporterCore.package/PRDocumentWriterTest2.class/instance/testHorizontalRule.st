tests
testHorizontalRule
	| item  |
	item := PRHorizontalRule new.
	self assertWriting: item includesText: self horizontalRule