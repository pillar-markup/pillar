printing
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: file fullName;
		nextPutAll: ')'