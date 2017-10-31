accessing
jsonStreamWithContent: aString
	| expected |
	expected := '' writeStream
		<< '{';
		<< '"content":"';
		<< aString;
		<< '"}';
		yourself.
	^ expected