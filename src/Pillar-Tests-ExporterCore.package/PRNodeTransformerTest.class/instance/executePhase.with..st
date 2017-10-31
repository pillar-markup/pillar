transformation
executePhase: anInput with: aConfig
	^ (self actualClass
		executeOn:
			(PRCompilationContext withDocument: anInput withConfiguration: aConfig))
		input