printing
asPillarParametersOn: aStream 

	self parameters at: 'value' ifPresent: [ :v | aStream nextPutAll: 'value='; nextPutAll: v].