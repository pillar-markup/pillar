tests
testPreformattedWithMultipleLines
	| item |
	item := PRPreformatted new
		add: (PRText content: 'foo');
		add: (PRText content: 'bar');
		yourself.
	self assertWriting: item includesText: 'foo' , self configuration newLine