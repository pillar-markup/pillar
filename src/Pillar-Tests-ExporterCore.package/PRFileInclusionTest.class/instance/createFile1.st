running
createFile1
	| stream |
	stream := (directory / 'foo.pillar') writeStream.
	stream nextPutAll: '!!Hello World'.
	stream close