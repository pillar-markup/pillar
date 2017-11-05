parsing
parse: aStringOrStream
	| stream isSton ston doc |
	stream := aStringOrStream readStream.
	stream atEnd
		ifTrue: [ ^ PRDocument new ].
	isSton := stream next = ${ and: [ stream peek ~~ ${ ].
	stream skip: -1.
	ston := isSton
		ifTrue: [ (STON reader on: stream) next ]
		ifFalse: [ Dictionary new ].
	doc := super parse: stream upToEnd.
	ston keysAndValuesDo: [ :key :value | doc propertyAt: key put: value ].
	^ doc