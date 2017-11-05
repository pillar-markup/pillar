printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' text: '; print: self text