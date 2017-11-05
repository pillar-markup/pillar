grammar - Reference
referenceUntil: aParser
	^ (escapedCharacter / (aParser / parameterMarkup / newline) negate) plus