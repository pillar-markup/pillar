tests
testInclude1File
	| input result |
	input := PRDocument with: (self fileInclusionTo: 'foo.pillar').
	result := PRDocument
		with:
			(PRHeader new
				level: 2;
				add: (PRText content: 'Hello World');
				yourself).
	
	self
		assert: (self
			executePhase: input
			with: (self configuration
				input: input;
				yourself))
		equals: result