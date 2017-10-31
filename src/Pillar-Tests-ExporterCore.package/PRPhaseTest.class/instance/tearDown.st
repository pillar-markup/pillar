running
tearDown
	super tearDown.
	(Smalltalk globals classNamed: 'PRMockPhase') ifNotNil: [ :class | class removeFromSystem ]