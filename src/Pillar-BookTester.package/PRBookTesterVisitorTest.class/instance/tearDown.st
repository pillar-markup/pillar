running
tearDown

	"PRBookTestDummyClass subclassesDo: [ :sub | ((sub name = #PRBookTestDummyMethodDefinition) 
															 or: (sub name = #PRBookTestDummyTestDefinition))
																	ifFalse: (PRBookTestDummyClass removeSubclass: sub) ].
	PRBookTestDummyTestDefinition methodDict removeAll.
	PRBookTestDummyMethodDefinition methodDict removeAll."							
	