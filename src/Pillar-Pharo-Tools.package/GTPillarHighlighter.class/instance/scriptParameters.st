accessing
scriptParameters
	^ super scriptParameters
	==> [ :array |
		(({ array first } asOrderedCollection addAll: array last; yourself)
			collect: [ :each |
				('' join: each first) -> (each second ifNotNil: [:second | '' join: second ]) ]) ]