parsing
parse: aStringOrStream
	| hasProperties properties doc |
	aStringOrStream readStreamDo: [ :stream  |
		stream atEnd
			ifTrue: [ ^ PRDocument new ].
		hasProperties := stream next = ${ and: [ stream next ~~ ${ ] ].
	
	aStringOrStream readStreamDo: [ :stream |
		properties := hasProperties
			ifTrue: [ (STON reader on: stream) next ]
			ifFalse: [ Dictionary new ].
		doc := self parseDocument: stream upToEnd.
		properties
			keysAndValuesDo: [ :key :value | doc propertyAt: key put: value ].
		^ doc ]