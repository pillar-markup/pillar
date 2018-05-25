parsing
parse: aStringOrStream
	| stream hasProperties properties doc |
	stream := aStringOrStream readStream.
	[ stream atEnd
			ifTrue: [ ^ PRDocument new ].
		hasProperties := stream next = ${ and: [ stream next ~~ ${ ] ]
			ensure: [ stream close ].
	
	stream := aStringOrStream readStream.
	[ properties := hasProperties
			ifTrue: [ (STON reader on: stream) next ]
			ifFalse: [ Dictionary new ].
		doc := self parseDocument: stream upToEnd.
		properties
			keysAndValuesDo: [ :key :value | doc propertyAt: key put: value ].
		^ doc ] ensure: [ stream close ]