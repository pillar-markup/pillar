tests
testBookEpub

	| archive |
	self testArchetype: self archetypeBook output: self outputEPub.
	self assert: (project outputDirectory / 'epub' / 'index.epub') exists.
	
	archive := ZipArchive new.
	archive readFrom: (project outputDirectory / 'epub' / 'index.epub') fullName.
		
	self assert: archive members first fileName equals: 'mimetype'.
	self assert: (archive memberNamed: 'contents.opf') notNil.
	self assert: (archive memberNamed: 'contents.xhtml') notNil.