comparing
= anObject
	^ super = anObject
		and: [ self align = anObject align
		and: [ self heading = anObject heading ] ]