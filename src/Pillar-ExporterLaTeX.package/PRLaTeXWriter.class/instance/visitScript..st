visiting-document
visitScript: aScript
	| env parameters |
	parameters := OrderedCollection new.
	aScript hasCaption
		ifTrue: [ parameters add: 'caption={' , (self getStringForAll: aScript caption children), '}' ].
	aScript hasLabel
		ifTrue: [ parameters add: 'label=' , aScript label ].
	(self languageForScript: aScript) isSyntaxHighlightingPossible
		ifTrue:
			[ parameters add: 'language=' , (self languageForScript: aScript) printString ].
	env := canvas environment
		name: 'listing';
		yourself.
	parameters ifNotEmpty: [ env optParameter: parameters asCommaString ].
	env
		with: [ self writeRawDuring: [ super visitScript: aScript ].
			canvas newLine ]