writing
writeBlockQuoteDuring: aBlockClosure 
	
	self
		writePrefix: '> '
		forEachLineDuring: aBlockClosure.