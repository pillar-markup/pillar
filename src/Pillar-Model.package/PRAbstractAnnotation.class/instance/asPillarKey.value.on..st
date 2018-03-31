rendering
asPillarKey: key value: aValue on: aStream

	aStream 
		nextPutAll: key; 
		nextPut: self class keyValueSeparator;
		nextPutAll: aValue