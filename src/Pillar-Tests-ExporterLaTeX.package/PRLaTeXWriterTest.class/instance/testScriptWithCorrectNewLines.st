tests
testScriptWithCorrectNewLines
	| item |
	item := (PRCodeblock content: 'foo')
		label: 'myScript';
		caption: 'a caption';
		yourself.
	self
		assertWriting: item
		includesText:
			self configuration newLine , 'foo' , self configuration newLine , '\end{'