private
writeInternalLink: anInternalLink withRef: href
	"http://spec.commonmark.org/0.28/#links"

	canvas nextPut: $[.
	anInternalLink counter isValidCounter
		ifTrue: [ self writeCounter: anInternalLink counter.
			anInternalLink hasAlias
				ifTrue: [ canvas nextPutAll: ' ' ] ].
	anInternalLink hasAlias
		ifTrue: [ canvas nextPutAll: anInternalLink alias ].
	canvas nextPut: $].
	canvas raw: '(' , href , ')'