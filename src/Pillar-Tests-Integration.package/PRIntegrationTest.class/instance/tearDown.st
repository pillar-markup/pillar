running
tearDown

	Smalltalk garbageCollect.
	projectDirectory ensureDeleteAll.
	super tearDown.