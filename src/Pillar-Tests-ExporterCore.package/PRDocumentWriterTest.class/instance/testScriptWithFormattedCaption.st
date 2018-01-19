tests
testScriptWithFormattedCaption
	| item |
	item := (PRCodeblock content: 'bar')
		caption: '""foo""';
		yourself.
	self assertWriting: item includesText: self boldFoo