descriptions migrated to instance
descriptionDisabledPhases
	<magritteDescription>
	^ MAToManyScalarRelationDescription new
		priority: 100;
		accessor: #disabledPhases;
		label: 'List of disabled phases.';
		cocoonDocumentation: 'Collection of phases that Pillar should ignore.' , "(PRTransformersDocumentation on: String new writeStream) contents," '

For exemple, a value of ==["scriptEvaluator", "section", "transform"]== will disable script evaluation (useful when security is important), sectioning (useful when generating HTML 4) and the transform phases (i.e. all the transformers) .';
		classes: {ByteString};
		default: Array new;
		cocoonDefaultDocumentation: 'By default the collection is empty, i.e., all phases are active.';
		yourself