descriptions
asPillarParametersOn: aStream

	self parameters at: 'note' ifPresent: [ :v | aStream nextPutAll: 'note='; nextPutAll: v].