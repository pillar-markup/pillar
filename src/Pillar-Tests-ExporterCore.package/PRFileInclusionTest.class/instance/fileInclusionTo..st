helpers
fileInclusionTo: aString
	^ PRInputFileAnnotation
		parameters:
			(SmallDictionary new
				at: 'value' put: aString;
				yourself)