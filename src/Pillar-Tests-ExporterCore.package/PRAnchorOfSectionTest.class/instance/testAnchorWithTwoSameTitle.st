tests
testAnchorWithTwoSameTitle
	| input expected config |
	config := self configuration.
	self addHeader: (Dictionary with: 'autoAnchor' -> true) ofLevel: 2 to: config.
	
	input := PRDocument new
		add:
				(PRHeader new	level: 2;
						add: (PRText content: 'foo'));
		add:
				(PRHeader new	level: 2;
						add: (PRText content: 'foo'));
		yourself.
	expected := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@1');
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@2') yourself.
	self assert: (self executePhase: input with: config) equals: expected