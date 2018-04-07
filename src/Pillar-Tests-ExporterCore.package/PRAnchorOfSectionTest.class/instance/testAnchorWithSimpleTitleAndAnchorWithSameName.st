tests
testAnchorWithSimpleTitleAndAnchorWithSameName
	| input expected config |
	config := self configuration.
	config printer level2 autoAnchor: true. 
	
	input := PRDocument new
		add:
				(PRHeader new	level: 2;
						add: (PRText content: 'foo'));
						add: (PRAnchor named: 'foo@41') yourself.
	
	expected := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'foo'));
		add: (PRAnchor named: 'foo@42');
		add: (PRAnchor named: 'foo@41') yourself.
	self assert: (self executePhase: input with: config) equals: expected