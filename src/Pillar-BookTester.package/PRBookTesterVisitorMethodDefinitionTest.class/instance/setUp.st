running
setUp
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	PRBookTestDummyMethodDefinition methods do: [ :each | each removeFromSystem ].
	(PRBookTestDummyMethodDefinition class) methods do: [ :each | each removeFromSystem ]

