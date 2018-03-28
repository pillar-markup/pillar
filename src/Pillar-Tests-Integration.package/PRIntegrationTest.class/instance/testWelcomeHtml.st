tests
testWelcomeHtml

	self testArchetype: self archetypeWelcome output: self outputHtml.
	self assert: (project outputDirectory / 'html' / 'index.html') exists.