visiting
start: anObject
	canvas := self canvasClass on: stream.
	super start: anObject.
	canvas flush