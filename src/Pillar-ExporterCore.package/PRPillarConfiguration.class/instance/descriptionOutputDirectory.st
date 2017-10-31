descriptions
descriptionOutputDirectory
	<magritteDescription>
	^ MADirectoryDescription new
		accessor: #outputDirectory;
		priority: 100;
		label: 'Output Directory where we export.';
		cocoonDocumentation: 'Indicate where Pillar will create generated files.';
		cocoonDefaultDocumentation: 'The value of ==baseDirectory==';
		default: self baseDirectory;
		defaultDirectory: self baseDirectory;
		kind: AbstractFileReference;
		addCondition: [ :fileRef | fileRef isDirectory or: [ fileRef exists not ]];
		yourself