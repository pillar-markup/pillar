tests
testWelcomePdf

	self testArchetype: self archetypeWelcome output: self outputPdf.
	self assert: (project outputDirectory / 'pdf' / 'index.pdf') exists.