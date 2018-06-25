grammar - List
termListItem
	^ super termListItem ==> [ :array | 
		| item |
		item := array second withAll: (array third ifNil: [ {} ]).
		item addAll: array fourth.
		array fifth isNotNil ifTrue: [ 
			item addAll: (self listsParser parse: array fifth) ].
		item start: array first start; stop: array last stop.
		item ]