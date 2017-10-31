grammar - Reference
linkAlias
	^ ((escapedCharacter / (linkMarkup / referenceAliasMarkup) negate) star flatten, referenceAliasMarkup) ==> #first