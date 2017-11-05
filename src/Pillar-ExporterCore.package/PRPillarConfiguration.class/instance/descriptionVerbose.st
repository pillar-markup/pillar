descriptions migrated to instance
descriptionVerbose
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #verbose;
		priority: 100;
		label: 'Verbose log';
		cocoonDocumentation: 'Indicate whether Pillar should write a verbose log when exporting.';
		default: false;
		yourself