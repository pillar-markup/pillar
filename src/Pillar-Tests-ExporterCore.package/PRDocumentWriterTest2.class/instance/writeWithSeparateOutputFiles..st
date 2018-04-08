helpers
writeWithSeparateOutputFiles: aDocumentItem
	| writer |
	^ String
		streamContents: [ :stream | 
			writer := self createWriterWithSeparateOutputFilesOn: stream.
			writer start: aDocumentItem ]