writing
writeInternalLink: anInternalLink withRef: href
	"http://spec.commonmark.org/0.28/#links"
	canvas
		writeLinkDuring: [ 
			anInternalLink counter isValidCounter
				ifTrue: [ self writeCounter: anInternalLink counter.
					anInternalLink hasAlias
						ifTrue: [ canvas nextPutAll: ' ' ] ].
			anInternalLink hasAlias
				ifTrue: [ canvas nextPutAll: anInternalLink alias ]. ]
		destination: href