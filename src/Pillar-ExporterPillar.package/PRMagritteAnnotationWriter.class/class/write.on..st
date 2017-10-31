instance creation
write: anAnnotation on: aStream
	^ self new
		stream: aStream;
		write: anAnnotation