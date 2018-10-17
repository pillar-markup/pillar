building
documentFor: aFile

	^ PRCreateTestsDocument new
		project: aFile project;
		file: aFile;
		target: self;
		yourself