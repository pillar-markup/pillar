running
setUp

	super setUp.
	self ensureTestDirectory.
	project := PRProject on: projectDirectory.