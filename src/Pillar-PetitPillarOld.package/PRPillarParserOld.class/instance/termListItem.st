grammar - List
termListItem
	^ super termListItem
		==>
			[ :array | 
			| item |
			item := array first withAll: (array second ifNil: [ {} ]).
			item addAll: array third.
			array fourth isNotNil
				ifTrue:
					[ item addAll: (self listsParser parse: array fourth) ].
			item ]