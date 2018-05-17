parsing
parse: aStringOrStream
	| hasProperties |
	hasProperties := aStringOrStream readStreamDo: [ :stream |
		stream next = ${ and: [ stream next ~= ${ ] ].

	aStringOrStream readStreamDo: [ :stream | | doc properties |
		properties := hasProperties
			ifTrue: [ (STON reader on: stream) next ]
			ifFalse: [ Dictionary new ].
		doc := super parse: stream upToEnd.
		properties keysAndValuesDo: [ :key :value | doc propertyAt: key put: value ].
		^ doc
	].