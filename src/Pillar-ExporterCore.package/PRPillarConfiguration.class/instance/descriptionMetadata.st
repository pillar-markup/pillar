descriptions
descriptionMetadata
	<magritteDescription>
	^  CCMagritteConfigurationDescription new
		accessor: #metadata;
		priority: 100;
		label: 'Metadata for documents';
		cocoonDocumentation:
			'Each document can have metadata like title or authors';
		cocoonDefaultDocumentation: 'A dictionary of default default metadata';
		default: PRPillarConfiguration new;
		yourself