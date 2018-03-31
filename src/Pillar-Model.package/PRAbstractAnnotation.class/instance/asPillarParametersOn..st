rendering
asPillarParametersOn: aStream

	"by default do nothing. Each on the subclass should output its parameters in pillar format."
	
	"self parameters at: 'title' ifPresent: [ :v | aStream nextPutAll: 'title='; nextPutAll: v]."