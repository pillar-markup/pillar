adding
add: aString withNumber: number
	stream
		nextPutAll: number asString;
		nextPutAll: String tab;
		nextPutAll: aString