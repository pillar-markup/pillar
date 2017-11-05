descriptions
descriptionOutputFile
	<magritteDescription>
	^ PRMagrittePathOrStreamDescription new
		priority: 100;
		accessor: #outputFile;
		label: 'Output File name';
		cocoonDocumentation: 'If ==separateOutputFiles== is ==false==, indicate the name of the output file. This can also be a write stream.';
		cocoonDefaultDocumentation: 'A file named ''output'' with an extension depending on ==outputType==.';
		default: (RelativePath from: 'output');
		yourself