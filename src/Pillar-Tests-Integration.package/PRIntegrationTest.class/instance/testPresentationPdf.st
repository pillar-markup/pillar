tests
testPresentationPdf

	self testArchetype: self archetypePresentation output: self outputPdf.
	self assert: (project outputDirectory / 'pdf' / 'index.pdf') exists.