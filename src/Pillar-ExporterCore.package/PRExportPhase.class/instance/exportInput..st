actions
exportInput: aPillarContext
	| fileReference writer content |
	self flag: #TODO.
	
	writer := aPillarContext configuration outputType new.
	content := writer write: aPillarContext input.
	
	"We should clean streams vs files here"
	self configuration outputFile isStream ifTrue: [ 
		self configuration outputFile nextPutAll: content.
		^ self
	].

	fileReference := self configuration outputDirectory resolve: self configuration outputFile.
	fileReference ensureDelete.
	fileReference parent ensureCreateDirectory.
	fileReference writeStreamDo: [ :stream | stream nextPutAll: content ].