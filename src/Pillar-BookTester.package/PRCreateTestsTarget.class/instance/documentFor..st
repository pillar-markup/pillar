building
documentFor: aFile

	^ PRBasicCheckDocument new
		project: aFile project;
		file: aFile;
		target: self;
		yourself