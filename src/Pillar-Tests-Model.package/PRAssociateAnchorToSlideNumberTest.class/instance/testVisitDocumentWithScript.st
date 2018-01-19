tests
testVisitDocumentWithScript
	| item dictionary config |
	item := PRDocument new
		add:
				((PRCodeblock content: '|test| test := test')
						label: 'foo';
						yourself);
		yourself.
	dictionary := Dictionary with: 'foo' -> 1.
	config := PRPillarConfiguration new renderStructureAsSlide: false; yourself.
	self
		assert:
			(self actualInstance
				configuration: config;
				start: item)
		equals: dictionary