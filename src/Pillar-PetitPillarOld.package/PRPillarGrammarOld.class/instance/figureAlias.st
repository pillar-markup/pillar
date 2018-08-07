grammar - Reference
figureAlias
	^ ((escapedCharacter / (figureMarkup / referenceAliasMarkup) negate) star flatten, referenceAliasMarkup) ==> #first