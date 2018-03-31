printing
asPillarParametersOn: aStream

	self parameters at: 'width' ifPresent: [ :v | aStream nextPutAll: 'width='; nextPutAll: v].