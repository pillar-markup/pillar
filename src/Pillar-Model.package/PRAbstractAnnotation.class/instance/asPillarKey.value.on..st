rendering
asPillarKey: key value: aValue on: aStream
	"Output on aStream key = aValue."

	aStream
		nextPutAll: key;
		nextPut: self keyValueSeparator;
		nextPutAll: aValue