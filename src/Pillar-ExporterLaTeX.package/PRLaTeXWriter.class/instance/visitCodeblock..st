visiting-document
visitCodeblock: aCodeBlock
	| env parameters |
	parameters := OrderedCollection new.
	aCodeBlock hasCaption
		ifTrue: [ parameters add: 'caption={' , (self getStringForAll: aCodeBlock caption children), '}' ].
	aCodeBlock hasLabel
		ifTrue: [ parameters add: 'label=' , aCodeBlock label ].
	(self languageForScript: aCodeBlock) isSyntaxHighlightingPossible
		ifTrue:
			[ parameters add: 'language=' , (self languageForScript: aCodeBlock) printString ].
	env := canvas environment
		name: 'listing';
		yourself.
	parameters ifNotEmpty: [ env optParameter: parameters asCommaString ].
	env
		with: [ self writeRawDuring: [ super visitCodeblock: aCodeBlock ].
			canvas newLine ]