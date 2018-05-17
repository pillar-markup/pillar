writing
postWriteTransform: aFile

	"Package the EPUB into a zip file.
	The first element of the zip file should be a non compressed mimetype file"
	(self epubContentsGenerationDirectory, self extension)
		ensureDelete;
		binaryWriteStreamDo: [ :stream | | archive |
			archive := ZipArchive new.
			(archive addFile: (self epubContentsGenerationDirectory / 'mimetype') fullName as: 'mimetype')
				desiredCompressionMethod: ZipArchive compressionStored;
				unixFileAttributes: 0.
			self epubContentsGenerationDirectory allChildren do: [ :each |
				each = self epubContentsGenerationDirectory ifFalse: [ | absolutePathString relativePathString |
					absolutePathString := each fullName.
					relativePathString := each fileSystem stringFromPath: (each relativeTo: self epubContentsGenerationDirectory asAbsolute).
					(each isDirectory
						ifTrue: [ archive addDirectory: absolutePathString as: relativePathString ]
						ifFalse: [ archive addFile: absolutePathString as: relativePathString ])
							unixFileAttributes: 0 ] ].
			archive writeTo: stream ]