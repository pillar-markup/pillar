actions
createFile: aName With: text In: aDirectory
	| stream |
	stream := (aDirectory / aName) writeStream.
	stream nextPutAll: text.
	stream close