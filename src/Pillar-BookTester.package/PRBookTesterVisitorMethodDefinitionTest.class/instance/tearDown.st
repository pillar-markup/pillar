running
tearDown
	"Hooks that subclasses may override to define the fixture of test."
	
	PRBookTestDummyMethodDefinition methods do: [ :each | each removeFromSystem ]
