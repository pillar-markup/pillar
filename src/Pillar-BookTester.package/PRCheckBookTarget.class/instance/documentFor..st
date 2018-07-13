building
documentFor: aFile

	^ PRCheckBookDocument new
		project: aFile project;
		file: aFile;
		target: self;
		yourself