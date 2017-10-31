writing text
nextPutAll: aString
	aString do: [ :char | self nextPut: char ]