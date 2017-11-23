execution
doExecute
	
	self outputFile ensureDelete.
	self outputFile parent ensureCreateDirectory.
	self outputFile writeStreamDo: [ :stream | 
		stream binary.
		(ZnCharacterWriteStream on: stream) nextPutAll: self outputDocument outputText ].
	^ self outputFile