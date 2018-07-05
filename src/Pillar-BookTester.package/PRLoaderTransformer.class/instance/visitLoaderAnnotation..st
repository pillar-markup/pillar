visiting
visitLoaderAnnotation: aPRLoaderAnnotation
	
	| projectName accountName tagName |
	projectName := aPRLoaderAnnotation project asString.
	accountName := aPRLoaderAnnotation account asString.
	tagName := aPRLoaderAnnotation gitTag asString.
	
	IceLibgitRepository registry
		detect: [ :any | any name = projectName ]
		ifFound: #delete.

	Metacello new
		baseline: aPRLoaderAnnotation project;
		repository: 'github://', accountName, projectName,':', tagName, '/src';
		onUpgrade: [ :ex | ex useIncoming ];
		load.
	