helpers
endingCode
	| code |
	code := String new writeStream.
	code nextPutAll: Smalltalk os lineEnding.
	code nextPut: Character tab.
	^ code contents