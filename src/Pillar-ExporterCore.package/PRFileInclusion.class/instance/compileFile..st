protected
compileFile: file
	| context pipeline subDocument |
	pipeline := self buildFileInclusionPipeline: self configuration.
	context := PRCompilationContext new
		input: file;
		configuration: self configuration.
	subDocument := (pipeline executeOn: context) input.
	^ subDocument