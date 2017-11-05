visiting-document
searchParam: aString in: aFigure
"Search in the figure parameters if the parameter aString is present and return the parameter and its value folowing the scheme param=""value"" "
	^
		aFigure parameters
			at: aString
			ifPresent: [ :param |  aString, '="', param greaseString, '"']
			ifAbsent: [ '' ]