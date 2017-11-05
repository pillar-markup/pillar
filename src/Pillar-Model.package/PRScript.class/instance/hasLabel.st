testing
hasLabel
	| label |
	label := self parameters at: 'label' ifAbsent: [ ^ false ].
	^ label isEmptyOrNil not