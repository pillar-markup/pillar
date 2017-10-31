helpers
createWriterOn: aWriteStream 
	^ (self actualClass on: aWriteStream)
		configuration: self configuration;
		yourself