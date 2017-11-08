actions
exportInput: aPillarContext
	| contentToWrite relativePath extension outputFileReference outputFormat |
	contentToWrite := aPillarContext input outputText.

	"We should clean streams vs files here"
	self configuration outputFile isStream
		ifTrue: [ self configuration outputFile nextPutAll: contentToWrite.
			^ self ].

	outputFormat := self configuration propertyAt: #_outputFormat.
	extension := outputFormat extension.
	relativePath := self configuration input file path
		relativeTo: self configuration baseDirectory path.
	outputFileReference := ((self configuration outputDirectory / outputFormat outputDirectoryName
		resolve: relativePath parent) / relativePath basename), extension.
	
	outputFileReference ensureDelete.
	outputFileReference parent ensureCreateDirectory.
	outputFileReference writeStreamDo: [ :stream | stream nextPutAll: contentToWrite ]