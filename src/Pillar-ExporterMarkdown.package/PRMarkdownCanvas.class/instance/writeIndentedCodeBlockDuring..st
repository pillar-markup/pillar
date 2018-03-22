writing
writeIndentedCodeBlockDuring: aBlockClosure 
	
	self
		writePrefix: '    '
		forEachLineDuring: aBlockClosure.