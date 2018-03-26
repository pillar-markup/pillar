visiting-document
capitalizeEnglish: aString

	| substrings result |
	substrings := (aString substrings) asOrderedCollection.
	result := '' writeStream.
	result << (substrings removeFirst) capitalized << ' '.

	substrings do: [ :each | result << ((self class nonCapitalizedWordEnglish includes: each)
																					ifTrue: [ each ]
																					ifFalse: [ each capitalized ])
														  << ' '].
	
	^ result contents trimBoth
