visiting-document
visitCodeblock: aCodeBlock
	| env |
	aCodeBlock language isSyntaxHighlightingPossible
		ifTrue: [ 
			canvas
				raw: '% syntax highlighting = ' , (self languageForScript: aCodeBlock) printString;
				newLine ].
	env := (aCodeBlock hasCaption or: [ aCodeBlock hasLabel ])
		ifTrue: [ 
			canvas environment
				name: 'script';
				optParameter: aCodeBlock label;
				parameter: [ self noNewLineDuring: [ self visit: aCodeBlock caption ] ];
				yourself ]
		ifFalse: [ 
			canvas environment
				name: 'listing';
				parameter: '';
				yourself ].
	env with: [ self writeRawDuring: [ self visitText: aCodeBlock ]. canvas newLine ]