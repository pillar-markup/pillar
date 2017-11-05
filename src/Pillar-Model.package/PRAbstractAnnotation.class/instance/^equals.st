comparing
= anObject
	^ super = anObject and: [ self parameters = anObject parameters and: [ self hadAllKeys = anObject hadAllKeys ] ]