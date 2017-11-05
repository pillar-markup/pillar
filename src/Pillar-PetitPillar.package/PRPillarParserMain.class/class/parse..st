parsing
parse: aStringOrStream
	| stream ston doc |
	stream := aStringOrStream readStream.
	stream atEnd
		ifTrue: [ ^ PRDocument new ].
	ston := self parseProperties: stream.
	doc := self parseDocument: stream upToEnd.
	ston
		keysAndValuesDo: [ :key :value | doc propertyAt: key put: value ].
	^ doc