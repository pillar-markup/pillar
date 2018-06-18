private
createFilesIn: aDirectory

	(aDirectory / PRDocListTransformerTest fileNameOne)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocListTransformerTest fileContentsOne ].
		
	(aDirectory / PRDocListTransformerTest fileNameTwo)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocListTransformerTest fileContentsTwo ].
		
	(aDirectory / PRDocListTransformerTest fileNameThree)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocListTransformerTest fileContentsThree ]