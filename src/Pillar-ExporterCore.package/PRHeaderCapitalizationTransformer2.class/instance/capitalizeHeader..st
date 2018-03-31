visiting-document
capitalizeHeader: aString
	
	^ String streamContents: [ :s | 
		aString substrings
			do: [ : each |  s << each capitalized]
			separatedBy: [ s  <<' ' ] ]