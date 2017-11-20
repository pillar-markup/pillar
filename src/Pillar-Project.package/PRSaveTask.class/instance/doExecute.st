execution
doExecute
	
	self outputFile ensureDelete.
	self outputFile parent ensureCreateDirectory.
	self outputFile writeStreamDo: [ :stream | 
		stream nextPutAll: pillarDocument execute input outputText ]