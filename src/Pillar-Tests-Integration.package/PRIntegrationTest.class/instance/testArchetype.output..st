tests
testArchetype: archetype output: output

	FileStream stdout
		nextPutAll: FileLocator imageDirectory fullName;
		cr.
	project archetype: archetype.
	project build: output