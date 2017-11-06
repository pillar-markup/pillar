actions
actionOn: anInput
	| fileReference |
	fileReference := self configuration outputDirectory resolve: self configuration outputFile.
	fileReference ensureDelete.
	fileReference parent ensureCreateDirectory.
	fileReference writeStreamDo: [ :stream | stream nextPutAll: anInput ].
	^ anInput