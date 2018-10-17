initialization
initialize
	super initialize.
	codeblockDict := {(#isEvaluated -> #evaluate:).
	(#isExample -> #visitCodeblockExample:).
	(#isMethodDefinition -> #visitCodeblockMethodDefinition:).
	(#isClassDefinition -> #visitCodeblockClassDefinition:)} asDictionary.
	allTestResults := OrderedCollection new.
	workingDirectory := FileLocator home.
	finalStatus := true