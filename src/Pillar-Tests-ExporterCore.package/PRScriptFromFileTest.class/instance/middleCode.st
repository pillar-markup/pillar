helpers
middleCode
	| code |
	code := String new writeStream.
	code
		nextPutAll: '|test|';
		nextPutAll: Smalltalk os lineEnding;
		nextPutAll: 'test := 1.';
		nextPutAll: Smalltalk os lineEnding;
		nextPutAll: 'test := 1+1'.
	^ code contents