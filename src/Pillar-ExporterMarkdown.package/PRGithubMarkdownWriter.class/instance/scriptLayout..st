protected
scriptLayout: aScript
	| language |
	language := self languageForScript: aScript.
	canvas nextPutAll: '```'.
	language isSyntaxHighlightingPossible ifTrue: [ canvas raw: language printString ].
	canvas raw: aScript text, '```'