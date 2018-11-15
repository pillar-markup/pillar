building
templatedWriter

	^ PRTemplatedWriter new
		outputDocument: self;
		defaultWriter: self writer;
		yourself