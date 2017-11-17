building
buildFile: inputDocument withOutput: buildTarget

	| configuration outputDirectory extension relativePath outputFile destinationDirectory templating |
	self halt.

	outputDirectory := self configuration outputDirectory  / buildTarget outputDirectoryName.
	extension := buildTarget extension.
	relativePath := inputDocument file path
		relativeTo: self configuration baseDirectory path.
	destinationDirectory := outputDirectory resolve: relativePath parent.
	outputFile := (destinationDirectory / relativePath basename), extension.


	templating := PRTemplatingTask new
		project: self;
		pillarDocument: (PROutputFormatterTask new
			project: self;
			pillarDocument: (PRTransformTask new
				addTransformation: (PRRelativeReferenceTransformer new
					destinationDirectory: destinationDirectory;
					yourself);
				pillarDocument: (PRExpandPillarFileTask new
					project: self;
					pillarDocument: (PRPillarParseTask new
						project: self;
						inputFile: inputDocument file)));
			outputFormat: buildTarget);
		templateFile: (self configuration baseDirectory / ((buildTarget writerFor: self configuration) templateForConfiguration: self configuration)).

	PRSaveTask new
		pillarDocument: templating;
		outputFile: outputFile