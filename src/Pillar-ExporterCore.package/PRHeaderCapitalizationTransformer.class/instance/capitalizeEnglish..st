visiting-document
capitalizeEnglish: aString

	^ String streamContents: [ :s | 
		aString substrings 
			do: [ :each | s << (self englishWordCapitalize: each)]
			separatedBy: [ s << ' ']]
	
	
