visiting-document
capitalizeHeader: aString
	
	| stream |
	stream := '' writeStream.
	((aString substrings) inject: '' into: [ :subtotal :next | stream << next capitalized << ' ' ]).
	^ stream contents trimBoth