building
build: output

	self prepareForTarget: output.
	self filesToBuild do: [ :each |
		self buildFile: each withOutput: output ]