visiting-document
visitScript: aScript
	|language   params |
	
	aScript hasLabel
		ifTrue: [ self createAnchorWith: aScript label ].
	
	params := ''.
	
	language := self languageForScript: aScript.
	language isSyntaxHighlightingPossible
		ifTrue: [ params := 'source,', language  printString, ','].
	
	stream << '[' << params << 'caption="' << (self getStringForAll: aScript caption children) << '"]'.
	canvas newLine.
	stream << '----'.
	canvas newLine.
	stream << [ super visitScript: aScript ].
	canvas newLine.
	stream << '----'