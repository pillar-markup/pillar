tests
testVisitWithoutSlideWithHeaderRendering
	| item dictionary config |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Foo'));
		add: (PRAnchor named: 'Bar');
		yourself.
	dictionary := Dictionary with: 'Bar' -> 2.
	config := PRPillarConfiguration new renderStructureAsSlide: true; yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary