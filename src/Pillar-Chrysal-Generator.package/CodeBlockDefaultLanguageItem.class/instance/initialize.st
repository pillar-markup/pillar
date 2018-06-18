initialization
initialize

	super initialize. 
	propertyName := #defaultScriptLanguage.
	explanation := 'Indicate the language in scripts when none is specified. This language is used for syntax highlighting. The currently supported languages are ', self possibleValuesString