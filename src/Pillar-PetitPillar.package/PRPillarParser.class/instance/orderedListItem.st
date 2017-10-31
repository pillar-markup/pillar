grammar - List
orderedListItem
	^ super orderedListItem
		==>
			[ :array | 
			| item |
			item := PRListItem withAll: (array second ifNil: [ {} ]).
			item addAll: array third.
			array fourth isNotNil
				ifTrue:
					[ item addAll: (self listsParser parse: array fourth) ].
			item ]