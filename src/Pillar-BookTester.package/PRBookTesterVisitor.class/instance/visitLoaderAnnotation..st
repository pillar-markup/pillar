visiting-annotations
visitLoaderAnnotation: aPRLoaderAnnotation
	
	| projectName accountName tagName baselineName |
	projectName := aPRLoaderAnnotation project asString.
	accountName := aPRLoaderAnnotation account asString.
	tagName := aPRLoaderAnnotation gitTag asString.
	baselineName := aPRLoaderAnnotation baseline asString.
	
	self class environment at: #IceLibgitRepository ifPresent: [ :class |
		class registry
			detect: [ :any | any name = projectName ]
			ifFound: #delete. ].

	self class environment at: #IceRepository ifPresent: [ :class |
		class registry
			detect: [ :any | any name = projectName ]
			ifFound: [ :repo |
				repo loadedPackages do: #unload.
				MCRepositoryGroup default removeRepository: repo metacelloAdapter.
				repo forget] ].

	Metacello new
		baseline: baselineName;
		repository: 'github://', accountName,'/', projectName,':', tagName, '/src';
		onUpgrade: [ :ex | ex useIncoming ];
		load.
	