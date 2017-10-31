tests
testScriptWithCorrectNewLines
	| item |
	item := (PRScript content: 'foo')
		label: 'myScript';
		caption: 'a caption';
		yourself.
	self
		assertWriting: item
		includesText:
			self configuration newLine , 'foo' , self configuration newLine , '\end{'