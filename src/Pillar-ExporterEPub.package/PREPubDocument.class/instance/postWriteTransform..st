writing
postWriteTransform: aFile

	"Package the EPUB into a zip file.
	The first element of the zip file should be a non compressed mimetype file"
	| fileReference |
	fileReference := self epubContentsGenerationDirectory, self extension.
	fileReference ensureDelete.
	
	SystemVersion current major <= 6 ifTrue: [ 
		fileReference writeStreamDo: [ :stream | 
			stream binary.
			self writeZipFileOn: stream.
			^ self ] ].
	fileReference binaryWriteStreamDo: [ :stream | self writeZipFileOn: stream ]