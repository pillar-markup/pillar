helpers
aCode
	| code |
	code := String new writeStream.
	code
		nextPutAll: self headingCode;
		nextPutAll: self middleCode;
		nextPutAll: self endingCode.
	^ code contents