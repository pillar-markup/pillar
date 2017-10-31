protected
optionalParametersForFloatingScript: aScript 
	| parameters |
	parameters := OrderedCollection new.
	parameters add: 'float'.
	aScript hasLabel ifTrue: [ parameters add: 'label=', aScript label ].
	aScript hasShortCaption ifTrue: [ parameters add: 'list text={', aScript shortCaption, '}' ].
	^ parameters asCommaString