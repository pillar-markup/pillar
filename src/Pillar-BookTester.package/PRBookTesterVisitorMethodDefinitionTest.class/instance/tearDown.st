running
tearDown
	"Hooks that subclasses may override to define the fixture of test."
	
	PRBookTestDummyMethodDefinition methods do: [ :each | each removeFromSystem ].
	(PRBookTestDummyMethodDefinition class) methods do: [ :each | each removeFromSystem ].
	(PRBookTestDummyClass allSubclasses includes: PRBookTestDummyClassCreation)
		ifTrue: [SystemDictionary new removeClassNamed: PRBookTestDummyClassCreation].