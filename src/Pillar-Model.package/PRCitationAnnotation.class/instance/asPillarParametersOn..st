printing
asPillarParametersOn: aStream

	self parameters at: 'ref' ifPresent: [ :v | aStream nextPutAll: 'ref='; nextPutAll: v].
