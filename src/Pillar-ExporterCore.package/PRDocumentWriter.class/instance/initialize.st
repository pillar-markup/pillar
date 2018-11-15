initialization
initialize
	super initialize.
	writingRaw := false.
	self setStream: self defaultStream.
	canvas := self canvasClass on: stream.