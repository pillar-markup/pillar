accessing
jsonStreamWithContent: aString withTitle: anOtherString
	| expected |
	expected := '' writeStream
		<< '{';
		<< '"content":"';
		<< aString;
		<< '",';
		<< '"title":"';
		<< anOtherString;
		<< '"';
		<< '}';
		yourself.
	^ expected