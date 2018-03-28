tests
testBookEpub

	self testArchetype: self archetypeBook output: self outputEPub.
	self assert: (project outputDirectory / 'epub' / 'index.epub') exists.
	
	(project outputDirectory / 'epub' / 'index.epub') readStreamDo: [ :stream | | archive |
		stream binary.
		archive := ZipArchive new.
		archive readFrom: stream.
		
		self assert: archive members first fileName equals: 'mimetype'.
		self assert: (archive memberNamed: 'contents.opf') notNil.
		self assert: (archive memberNamed: 'contents.xhtml') notNil.
	]