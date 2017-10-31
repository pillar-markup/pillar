tests
testDocumentWithFile
	| item set |
	item := PRDocument new
		add:
			(PRInternalLink new
				reference: 'file://foo.pillar';
				yourself);
		yourself.
	set := Set with: 'foo.pillar'.
	self
		assert: (self actualInstance start: item)
		equals: set