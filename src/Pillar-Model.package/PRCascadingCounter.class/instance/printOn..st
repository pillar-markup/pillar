printing
printOn: aStream
	self elements do: [ :each | aStream nextPutAll: each printString ] separatedBy: [ aStream nextPut: $. ]