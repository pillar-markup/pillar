writing
writeZipFileOn: stream
	| archive |
	archive := ZipArchive new.
	(archive addFile: (self epubContentsGenerationDirectory / 'mimetype') fullName as: 'mimetype')
		desiredCompressionMethod: ZipArchive compressionStored;
		unixFileAttributes: 0.
	self epubContentsGenerationDirectory allChildren
		do: [ :each | 
			each = self epubContentsGenerationDirectory asAbsolute
				ifFalse: [ | absolutePathString relativePathString |
					absolutePathString := each fullName.
					relativePathString := each fileSystem stringFromPath: (each relativeTo: self epubContentsGenerationDirectory asAbsolute).
					(each isDirectory
						ifTrue: [ archive addDirectory: absolutePathString as: relativePathString ]
						ifFalse: [ archive addFile: absolutePathString as: relativePathString ]) unixFileAttributes: 0 ] ].
	archive writeTo: stream