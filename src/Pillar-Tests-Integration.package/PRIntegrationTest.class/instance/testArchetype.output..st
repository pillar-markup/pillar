tests
testArchetype: archetype output: output

	project installArchetypeNamed: archetype.
	project build: output.
	
	self assert: project outputDirectory children size equals: 1.
	self assert: project outputDirectory children first basename equals: output outputDirectoryName.