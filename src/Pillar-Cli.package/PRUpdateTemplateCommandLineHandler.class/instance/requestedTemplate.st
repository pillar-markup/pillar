activation
requestedTemplate

	| nonOptions |
	self optionAt: 'template' ifPresent: [ :value | ^ value ].

	"also managed ./pillar updateTemplate book (to be backward compatible)"
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions size = 1
		ifTrue: [ nonOptions last ]
		ifFalse: [ self errorMissingParameter: 'template' ].