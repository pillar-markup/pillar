tests
testDocumentWithFigure
	| item set |
	item := PRDocument new
		add:
			(PRFigure new
				reference: 'file://foo.png';
				yourself);
		yourself.
	set := Set new.
	self
		assert: (self actualInstance start: item)
		equals: set