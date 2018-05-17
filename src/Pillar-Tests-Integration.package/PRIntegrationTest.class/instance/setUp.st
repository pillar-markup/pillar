running
setUp

	super setUp.
	self timeLimit: 1 minute.
	self ensureTestDirectory.
	project := PRProject on: projectDirectory.