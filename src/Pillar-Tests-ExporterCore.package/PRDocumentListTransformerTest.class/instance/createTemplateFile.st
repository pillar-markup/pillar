private
createTemplateFile

	(self workingDirectory / 'templates/docArticle.mustache')
		writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsOne ].