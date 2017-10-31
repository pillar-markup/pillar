comparing
= anObject
	^ super = anObject and: [ self reference = anObject reference and: [ self parameters = anObject parameters ] ]