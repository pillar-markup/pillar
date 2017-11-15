running
tearDown
	super tearDown.
	(directory / 'foo.pillar') delete.
	(directory / 'bar.pillar') delete.
	(directory / 'tata' / 'toto.pillar') delete.
	(directory / 'tata') ensureDelete.
	(directory / 'timoleon.pillar') delete