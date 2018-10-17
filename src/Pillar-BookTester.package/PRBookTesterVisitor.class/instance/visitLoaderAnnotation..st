visiting-annotations
visitLoaderAnnotation: aPRLoaderAnnotation
	
	| projectName accountName tagName baselineName |
	projectName := aPRLoaderAnnotation project asString.
	accountName := aPRLoaderAnnotation account asString.
	tagName := aPRLoaderAnnotation gitTag asString.
	baselineName := aPRLoaderAnnotation baseline asString.
	
	IceLibgitRepository registry
		detect: [ :any | any name = projectName ]
		ifFound: #delete.

	Metacello new
		baseline: baselineName;
		repository: 'github://', accountName,'/', projectName,':', tagName, '/src';
		onUpgrade: [ :ex | ex useIncoming ];
		load.
	