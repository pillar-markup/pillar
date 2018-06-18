tests
testBookPdf

	self timeLimit: 2 minutes.
	self testArchetype: self archetypeBook output: self outputPdf.
	self assert: (project outputDirectory / 'pdf' / 'index.pdf') exists.