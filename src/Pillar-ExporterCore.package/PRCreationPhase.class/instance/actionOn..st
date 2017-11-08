actions
actionOn: anInput
	^ PRCompilationContext 
			withDocument: anInput configuration inputFile 
			withConfiguration: anInput configuration