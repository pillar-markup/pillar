visiting-document
visitCodeblock: aCodeBlock
	|language   params |
	
	aCodeBlock hasLabel
		ifTrue: [ self createAnchorWith: aCodeBlock label ].
	
	params := ''.
	
	language := self languageForScript: aCodeBlock.
	language isSyntaxHighlightingPossible
		ifTrue: [ params := 'source,', language  printString, ','].
	
	stream << '[' << params << 'caption="' << (self getStringForAll: aCodeBlock caption children) << '"]'.
	canvas newLine.
	stream << '----'.
	canvas newLine.
	stream << [ super visitCodeblock: aCodeBlock ].
	canvas newLine.
	stream << '----'