tests
testInFlowScriptWithCorrectNewLines
	| item |
	item := PRCodeblock content: 'foo'.
	self
		assertWriting: item
		includesText:
			self configuration newLine , 'foo' , self configuration newLine , '\end{'