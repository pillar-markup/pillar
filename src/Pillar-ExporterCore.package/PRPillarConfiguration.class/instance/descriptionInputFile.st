descriptions transcripted to chrysal
descriptionInputFile
	<magritteDescription>
	^ MAFileDescription new
		defaultDirectory: self baseDirectory;
		priority: 100;
		accessor: #inputFile;
		label: 'Input file to parse and export.';
		cocoonDocumentation: 'The Pillar file that must be exported. You can also specify an input file at the end of the command-line interface.';
		default: nil;
		kind: AbstractFileReference;
		yourself