private
createTemplateFile
	| dir templateFile |
	dir := (testingFileSystem / 'templates') ensureCreateDirectory.
	templateFile := (dir / 'docArticle.mustache') ensureCreateFile.
	templateFile writeStreamDo: [ :stream |
			stream nextPutAll: PRDocumentListTransformerTest fileContentsOne ].