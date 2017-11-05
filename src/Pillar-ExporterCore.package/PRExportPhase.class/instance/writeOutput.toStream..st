private
writeOutput: output toStream: outputStream
	outputStream nextPutAll: output.
	outputStream flush