tests
testVisitWithSlideWithoutHeaderRendering
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
	dictionary := Dictionary with: 'Bar' -> 1 with: 'bar' -> 2.
	config := PRPillarConfiguration new renderStructureAsSlide: false; yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary