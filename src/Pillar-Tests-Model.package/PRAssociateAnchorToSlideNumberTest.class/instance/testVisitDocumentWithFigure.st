tests
testVisitDocumentWithFigure
	| item dictionary config |
	item := PRDocument new
		add:
			(PRFigure new
				reference: 'file://picture.png';
				parameterAt: 'label' put: 'foo';
				yourself);
		yourself.
	dictionary := Dictionary with: 'foo' -> 1.
	config := self configurationClass new
		renderStructureAsSlide: false;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary