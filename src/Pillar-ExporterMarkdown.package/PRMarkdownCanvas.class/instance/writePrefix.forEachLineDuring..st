writing
writePrefix: aString forEachLineDuring: aBlockClosure 

	self pushPrefix: aString.
	aBlockClosure ensure: [ self popPrefix ].