descriptions
descriptionOutputType
	<magritteDescription>
	^ MAClassDescription new
		accessor: #outputType;
		priority: 100;
		label: 'Output Type.';
		cocoonDocumentation: 'Indicate the kind of output desired. Can be any of ',(PRDocumentWriter withAllConcreteClasses collect: #writerName) asCommaStringAnd,'.';
		default: nil;
		addCondition: [ :value | (PRDocumentWriter allSubclasses reject: [ :klass | klass isAbstract ]) anySatisfy: [ :each | each = value ] ];
		yourself