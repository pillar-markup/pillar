private
writeInternalLink: anInternalLink withRef: href
	canvas nextPut: $[.
	anInternalLink counter isValidCounter
		ifTrue: [ self writeCounter: anInternalLink counter.
			anInternalLink hasAlias
				ifTrue: [ canvas nextPutAll: ' ' ] ].
	anInternalLink hasAlias
		ifTrue: [ canvas nextPutAll: anInternalLink alias ].
	canvas nextPut: $].
	canvas raw: '(' , href , ')'