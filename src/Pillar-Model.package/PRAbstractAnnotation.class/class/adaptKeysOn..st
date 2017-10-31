protected
adaptKeysOn: aCollection
	| newDictionary |
	newDictionary := SmallDictionary new.
	aCollection
		keysDo: [ :key | 
			(aCollection at: key) isNil
				ifTrue: [ newDictionary at: self defaultParameterName put: key ]
				ifFalse: [ newDictionary at: key put: (aCollection at: key) ] ].
	^ newDictionary