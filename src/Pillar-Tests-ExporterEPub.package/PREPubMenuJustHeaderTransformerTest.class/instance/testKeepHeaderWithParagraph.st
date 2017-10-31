tests
testKeepHeaderWithParagraph
	| input expected |
	input := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'foo');
				yourself);
		add: (PRParagraph new add: (PRText content: 'bar'));
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
					(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						yourself)).
	self
		assert:
			(self
				executePhase: input
				with:
					(self configuration
						outputType: self actualWriterClass;
						yourself))
		equals: expected