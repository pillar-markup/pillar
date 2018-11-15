initialization
setStream: aStream
	stream := PROutputStream on: aStream.
	configuration ifNotNil: [ stream configuration: configuration ].
	canvas ifNotNil: [ canvas setStream: stream ].