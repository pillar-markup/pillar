writing
postWriteTransform: aFile

	"Package the EPUB into a zip file.
	The first element of the zip file should be a non compressed mimetype file"
	(self epubContentsGenerationDirectory, self extension)
		ensureDelete;
		writeStreamDo: [ :stream | | archive |
			archive := ZipArchive new.
			(archive addFile: (self epubContentsGenerationDirectory / 'mimetype') fullName as: 'mimetype')
				desiredCompressionMethod: ZipArchive compressionStored;
				unixFileAttributes: 0.
			self epubContentsGenerationDirectory allChildren do: [ :each |
				each = self epubContentsGenerationDirectory ifFalse: [
					(each isDirectory
						ifTrue: [ archive addDirectory: each as: (each fileSystem stringFromPath: (each relativeTo: self epubContentsGenerationDirectory)) ]
						ifFalse: [ archive addFile: each as: (each fileSystem stringFromPath: (each relativeTo: self epubContentsGenerationDirectory)) ])
							unixFileAttributes: 0 ] ].
			archive writeTo: stream ]