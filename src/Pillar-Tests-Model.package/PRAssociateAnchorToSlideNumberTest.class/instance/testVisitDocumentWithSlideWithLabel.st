tests
testVisitDocumentWithSlideWithLabel
	| item dictionary config |
	item := PRDocument new
		add: (PRSlide new label: 'foo');
		yourself.
	dictionary := Dictionary with: 'foo' -> 2.
	config := PRPillarConfiguration new renderStructureAsSlide: false; yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary