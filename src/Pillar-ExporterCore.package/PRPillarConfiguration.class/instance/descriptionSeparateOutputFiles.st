descriptions migrated to instance
descriptionSeparateOutputFiles
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #separateOutputFiles;
		priority: 100;
		label: 'Export with separate output files.';
		cocoonDocumentation: 'If ==true==, each input file is exported to one output file. If ==false== (the default), all input files are exported to ==outputFile==.';
		default: false;
		yourself