tests
testInFlowScriptWithCorrectNewLines
	| item |
	item := PRScript content: 'foo'.
	self
		assertWriting: item
		includesText:
			self configuration newLine , 'foo' , self configuration newLine , '\end{'