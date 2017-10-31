actions
export
	(PRCompilationPipeline buildPipe: self) sort
		executeOn: (PRCompilationContext configuration: self)