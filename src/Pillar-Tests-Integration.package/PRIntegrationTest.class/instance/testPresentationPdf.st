tests
testPresentationPdf

	self timeLimit: 2 minutes.
	self testArchetype: self archetypePresentation output: self outputPdf.
	self assert: (project outputDirectory / 'pdf' / 'index.pdf') exists.