writing text
lines: aString
	"Output aString and take care of line ending within aString."
	| str |
	str := aString readStream.
	[str atEnd] whileFalse: [ | line |
		line := str nextLine.
		str atEnd
			ifTrue: [ self nextPutAll: line ]
			ifFalse: [ self line: line ]
	 ]