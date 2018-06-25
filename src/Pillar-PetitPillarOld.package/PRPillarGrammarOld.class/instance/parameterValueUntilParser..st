grammar - Parameter
parameterValueUntilParser: aParser
	^ (parameterValueMarkup , (escapedCharacter / (aParser / parameterMarkup) negate) star) ==> [ :array | array second ]