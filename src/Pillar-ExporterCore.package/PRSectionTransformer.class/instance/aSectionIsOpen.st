testing
aSectionIsOpen
	sections
		do: [ :e | 
			e isNotNil
				ifTrue: [ ^ true ] ].
	^ false