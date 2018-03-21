building
build: output

	self prepareForTarget: output.
	(output filesToBuildOn: self)
		collect: [ :each |
			PRInputDocument new
				project: self;
				file: each;
				yourself ]
		thenDo: [ :each |
			self
				buildFile: each
				withOutput: output ]