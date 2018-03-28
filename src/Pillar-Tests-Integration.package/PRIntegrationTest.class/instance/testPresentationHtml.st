tests
testPresentationHtml

	self testArchetype: self archetypePresentation output: self outputHtml.
	self assert: (project outputDirectory / 'html' / 'index.html') exists.