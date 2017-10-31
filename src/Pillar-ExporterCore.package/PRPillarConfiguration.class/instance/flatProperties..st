converting
flatProperties: aDictionary
	self properties associationsDo: [ :assoc | 
		assoc value class = self class 
		ifTrue: [ assoc value flatProperties: aDictionary ] 
		ifFalse: [ aDictionary at: assoc key put: assoc value ]
	]