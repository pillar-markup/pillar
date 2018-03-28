tests
testBasicLatexHtml

	self testArchetype: self archetypeBasicLatex output: self outputHtml.
	self assert: (project outputDirectory / 'html' / 'index.html') exists.