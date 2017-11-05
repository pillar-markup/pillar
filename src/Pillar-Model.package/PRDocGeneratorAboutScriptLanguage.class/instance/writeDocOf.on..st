printing
writeDocOf: aClass on: aStream
	aStream
		nextPutAll: '- ';
		nextPutAll: aClass name;
		nextPutAll: ' which tag is: ';
		nextPutAll: aClass standardName; lf