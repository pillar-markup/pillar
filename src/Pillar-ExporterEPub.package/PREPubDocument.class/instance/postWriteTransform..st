writing
postWriteTransform: aFile

	| ebookDirectory configuration contentsOpfTemplate |
	outputDirectory := self outputDirectory resolve: (file file parent relativeTo: project baseDirectory asAbsolute).
	ebookDirectory := outputDirectory / file file withoutExtension basename.
	
	project baseDirectory children do: [ :each |
		((each basename beginsWith: '_') or: [ each basename beginsWith: '.' ]) ifFalse: [ 
			each copyAllTo: ebookDirectory / each basename ] ].

	(project baseDirectory resolve: '_support/epub')
		copyAllTo: ebookDirectory.

	configuration := self configuration allProperties.
	configuration
		at: 'manifestItems'
		put: '
		<item id="navigation" properties="nav" href="navigation.xhtml" media-type="application/xhtml+xml"/>
		<item id="contents" href="contents.xhtml" media-type="application/xhtml+xml" />'.

	configuration
		at: 'spineItems'
		put: '
		<itemref idref="navigation" linear="yes" />
		<itemref idref="contents" linear="yes" />'.

	contentsOpfTemplate := (project baseDirectory / '_support' / 'templates' / 'contents.opf.mustache') asMustacheTemplate.
	ebookDirectory / 'contents', 'opf' writeStreamDo: [:stream |
		stream nextPutAll: (contentsOpfTemplate value: configuration).
	].
	
	(ebookDirectory, self extension)
		ensureDelete;
		writeStreamDo: [ :stream | | archive |
			archive := ZipArchive new.
			(archive addFile: (ebookDirectory / 'mimetype') fullName as: 'mimetype')
				desiredCompressionMethod: ZipArchive compressionStored;
				unixFileAttributes: 0.
			ebookDirectory allChildren do: [ :each |
				each = ebookDirectory ifFalse: [
					(each isDirectory
						ifTrue: [ archive addDirectory: each as: (each fileSystem stringFromPath: (each relativeTo: ebookDirectory)) ]
						ifFalse: [ archive addFile: each as: (each fileSystem stringFromPath: (each relativeTo: ebookDirectory)) ])
							unixFileAttributes: 0 ] ].
			archive writeTo: stream ]