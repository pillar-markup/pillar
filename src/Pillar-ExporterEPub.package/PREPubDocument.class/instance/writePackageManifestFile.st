writing
writePackageManifestFile

	| configuration contentsOpfTemplate |
	
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
	self epubContentsGenerationDirectory / 'contents', 'opf' writeStreamDo: [:stream |
		stream nextPutAll: (contentsOpfTemplate value: configuration) ]