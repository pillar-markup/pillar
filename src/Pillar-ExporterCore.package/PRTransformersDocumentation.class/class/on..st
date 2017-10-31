instance creation
on: aStream
	"I generate the documentation of the Pillar transformers on a Stream."

	^ self new
		stream: aStream;
		generateDoc;
		stream