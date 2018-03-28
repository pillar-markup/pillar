tests
testBookHtml

	self testArchetype: self archetypeBook output: self outputHtml.
	self assert: (project outputDirectory / 'html' / 'index.html') exists.