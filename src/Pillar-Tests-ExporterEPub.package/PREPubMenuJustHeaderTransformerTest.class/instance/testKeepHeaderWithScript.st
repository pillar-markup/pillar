tests
testKeepHeaderWithScript
	| input expected |
	input := PRDocument new
		add: (PRScript content: 'hello');
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'foo');
				yourself);
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