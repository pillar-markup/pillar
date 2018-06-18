tests
testBasicLatexPdf

	self timeLimit: 1 minute.
	self testArchetype: self archetypeBasicLatex output: self outputPdf.
	self assert: (project outputDirectory / 'pdf' / 'index.pdf') exists.