tests
testScriptWithFormattedCaption
	| item |
	item := (PRScript content: 'bar')
		caption: '""foo""';
		yourself.
	self assertWriting: item includesText: self boldFoo