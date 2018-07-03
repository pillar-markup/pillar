private
createFilesIn: aDirectory

	(aDirectory / PRDocumentListTransformerTest fileNameOne)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsOne ].
		
	(aDirectory / PRDocumentListTransformerTest fileNameTwo)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsTwo ].
		
	(aDirectory / PRDocumentListTransformerTest fileNameThree)
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsThree ]