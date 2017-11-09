tests
testInclude1FileWithFigure
	| input result |
	input := PRDocument with: (self fileInclusionTo: 'tata/toto.pillar').
	result := PRDocument new
		add:
			(PRParagraph new
				add:
					(PRFigure new
						reference: 'tata/fig.png';
						parameterAt: 'width' put: '50';
						yourself);
				yourself);
		yourself.
	
	self
		assert: (self
			executePhase: input
			with: (self configuration
				input: input;
				yourself))
		equals: result