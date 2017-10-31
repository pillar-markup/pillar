tests
testDocumentWithFigure
	| item set |
	item := PRDocument new
		add:
			(PRFigure new
				reference: 'file://picture.png';
				parameterAt: 'label' put: 'foo';
				yourself);
		yourself.
	set := Set with: 'picture.png'.
	self
		assert: (self actualInstance start: item)
		equals: set