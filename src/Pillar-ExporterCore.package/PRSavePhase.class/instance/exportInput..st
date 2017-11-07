actions
exportInput: aPillarContext
	| fileReference contentToWrite |
	contentToWrite := aPillarContext input outputText.

	"We should clean streams vs files here"
	self configuration outputFile isStream
		ifTrue: [ self configuration outputFile nextPutAll: contentToWrite.
			^ self ].
	fileReference := self configuration outputDirectory
		resolve: self configuration outputFile.
	fileReference ensureDelete.
	fileReference parent ensureCreateDirectory.
	fileReference writeStreamDo: [ :stream | stream nextPutAll: contentToWrite ]