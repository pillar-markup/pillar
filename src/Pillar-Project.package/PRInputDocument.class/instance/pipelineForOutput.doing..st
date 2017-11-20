building
pipelineForOutput: aTarget doing: aBlock

	| builder outputDirectory extension relativePath outputFile |
	
	outputDirectory := project configuration outputDirectory  / aTarget outputDirectoryName.
	extension := aTarget extension.
	relativePath := self file path
		relativeTo: project configuration baseDirectory path.
	outputFile := ((project outputDirectory resolve: relativePath parent) / relativePath basename), extension.

	
	builder := PRPipelineBuilder new.
	builder project: project.
	builder target: aTarget.
	builder inputFile: file.
	builder outputFile: outputFile.
	
	self contributeToPipelineBuilding: builder.
	project contributeToPipelineBuilding: builder.
	aTarget contributeToPipelineBuilding: builder.
	aBlock value: builder.
	^ builder build