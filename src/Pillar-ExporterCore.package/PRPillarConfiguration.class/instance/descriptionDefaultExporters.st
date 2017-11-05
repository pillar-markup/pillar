descriptions
descriptionDefaultExporters
	<magritteDescription>
	^ MAToManyScalarRelationDescription new
		priority: 100;
		accessor: #defaultExporters;
		label: 'List of the default exporters.';
		cocoonDocumentation: 'Collection of exporters to use when none is explicitely specified. You can specify the exporter you want through the ==-\-to\=== command-line argument.';
		classes: {ByteString};
		default: (Array with: 'text');
		cocoonDefaultDocumentation: 'By default only the text exporter is enabled.';
		addCondition: [ :value | value isNotEmpty ];
		yourself