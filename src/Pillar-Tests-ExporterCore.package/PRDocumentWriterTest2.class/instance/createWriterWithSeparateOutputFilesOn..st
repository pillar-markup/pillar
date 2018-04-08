helpers
createWriterWithSeparateOutputFilesOn: aWriteStream
	^ (self actualClass on: aWriteStream)
		configuration:
				(self configurationClass new
						separateOutputFiles: true;
						yourself);
		yourself