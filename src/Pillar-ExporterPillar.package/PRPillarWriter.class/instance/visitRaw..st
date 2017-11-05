visiting-document
visitRaw: anObject
	canvas raw: (self markupFor: anObject).
	anObject type isNil
		ifFalse: [ canvas nextPutAll: anObject type; raw: PRPillarParser defaultMarkupRawType ].
	canvas raw: anObject text.
	canvas raw: (self markupEndFor: anObject)