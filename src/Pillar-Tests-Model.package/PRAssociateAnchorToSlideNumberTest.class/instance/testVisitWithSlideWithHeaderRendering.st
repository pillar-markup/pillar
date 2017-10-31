tests
testVisitWithSlideWithHeaderRendering
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
	dictionary := Dictionary with: 'Bar' -> 2 with: 'bar' -> 3.
	config := PRPillarConfiguration new renderStructureAsSlide: true; yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary