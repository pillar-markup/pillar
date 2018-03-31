visiting
asPillarParametersOn: aStream

	self parameters at: 'depthLevel' ifPresent: [ :v | aStream nextPutAll: 'depthLevel='; nextPutAll: v].
	aStream nextPutAll: '|'.
	self parameters at: 'level' ifPresent: [ :v | aStream nextPutAll: 'level='; nextPutAll: v].