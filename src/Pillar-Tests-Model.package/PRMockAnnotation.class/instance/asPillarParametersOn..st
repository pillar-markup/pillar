printing
asPillarParametersOn: aStream

	self parameters keys
		do: [ :each | 
				aStream nextPutAll: each.
				aStream nextPutAll: '='.
				aStream nextPutAll: (self parameters at: each)  ]
		separatedBy: [ aStream nextPutAll: '|' ]