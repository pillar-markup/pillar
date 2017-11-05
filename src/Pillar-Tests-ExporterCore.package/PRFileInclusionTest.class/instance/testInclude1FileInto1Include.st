tests
testInclude1FileInto1Include
	| input result |
	input := PRDocument with: (self fileInclusionTo: 'bar.pillar').
	result := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'Hello World');
				yourself);
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'Bye World');
				yourself);
		yourself.
	self assert: (self executePhase: input) equals: result