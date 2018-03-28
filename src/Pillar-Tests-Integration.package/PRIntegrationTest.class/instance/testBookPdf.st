tests
testBookPdf

	self testArchetype: self archetypeBook output: self outputPdf.
	self assert: (project outputDirectory / 'pdf' / 'index.pdf') exists.