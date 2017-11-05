visiting-document
visitScript: aScript
	| env |
	aScript language isSyntaxHighlightingPossible
		ifTrue: [ 
			canvas
				raw: '% syntax highlighting = ' , (self languageForScript: aScript) printString;
				newLine ].
	env := (aScript hasCaption or: [ aScript hasLabel ])
		ifTrue: [ 
			canvas environment
				name: 'script';
				optParameter: aScript label;
				parameter: [ self noNewLineDuring: [ self visit: aScript caption ] ];
				yourself ]
		ifFalse: [ 
			canvas environment
				name: 'listing';
				parameter: '';
				yourself ].
	env with: [ self writeRawDuring: [ self visitText: aScript ]. canvas newLine ]