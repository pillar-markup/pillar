building
filesToBuild
	
	^ self buildStrategy filesToBuild collect: [ :file |
		PRInputDocument new
			project: self;
			file: file;
			yourself ]