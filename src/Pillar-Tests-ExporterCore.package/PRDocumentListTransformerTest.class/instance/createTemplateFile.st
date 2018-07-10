private
createTemplateFile

	(FileSystem workingDirectory / 'templates/docArticle.mustache')
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsOne ].