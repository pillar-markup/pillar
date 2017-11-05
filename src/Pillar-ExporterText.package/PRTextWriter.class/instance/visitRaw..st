visiting-document
visitRaw: anObject
	(anObject type isNil or: [ anObject type = 'text' ])
		ifTrue: [ canvas nextPutAll: anObject text ]