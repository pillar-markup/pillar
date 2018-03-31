printing
asPillarParametersOn: aStream

	self parameters at: 'title' ifPresent: [ :v | aStream nextPutAll: 'title='; nextPutAll: v].