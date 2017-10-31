tests
testAnchorWithSimpleTitleAndAnchorWithSameName
	| input expected config |
	config := self configuration.
	self addHeader: (Dictionary with: 'autoAnchor' -> true) ofLevel: 2 to: config.
	
	input := PRDocument new
		add:
				(PRHeader new	level: 2;
						add: (PRText content: 'foo'));
						add: (PRAnchor named: 'foo@41') yourself..
	
	expected := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@42');
		add: (PRAnchor named: 'foo@41') yourself.
	self assert: (self executePhase: input with: config) equals: expected