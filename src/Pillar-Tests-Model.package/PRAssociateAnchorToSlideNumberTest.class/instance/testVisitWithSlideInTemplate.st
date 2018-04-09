tests
testVisitWithSlideInTemplate
	| item dictionary config |
	item := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Foo'));
		add: (PRAnchor named: 'Bar');
		add:
			(PRSlide new
				add: (PRAnchor named: 'bar');
				yourself) yourself.
	dictionary := Dictionary with: 'Bar' -> 3 with: 'bar' -> 4.
	config := self configurationClass new
		renderStructureAsSlide: true;
		slideInTemplateForDeckJS: 2;
		yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary