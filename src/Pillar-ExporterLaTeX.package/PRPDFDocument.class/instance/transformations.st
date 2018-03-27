accessing
transformations

	^ super transformations, { 
		PRRelativeReferenceTransformer new
			inputFile: self inputFile;
			baseDirectory: project baseDirectory asAbsolute;
			outputDirectory: self outputDirectory;
			yourself.
		PRLatexPathUpdateVisitor new }