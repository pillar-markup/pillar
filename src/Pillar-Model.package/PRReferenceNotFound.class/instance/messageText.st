accessing
messageText
	^inputFile ifNil: [ super messageText ] ifNotNil: [ inputFile pathString, ' ', super messageText ]