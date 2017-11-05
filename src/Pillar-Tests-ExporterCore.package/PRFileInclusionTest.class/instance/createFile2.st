running
createFile2
	| stream |
	stream := (directory / 'bar.pillar') writeStream.
	stream nextPutAll: '${inputFile:foo.pillar}$' , Smalltalk os lineEnding , '!!Bye World'.
	stream close