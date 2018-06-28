initialization
initialize

	super initialize.
	possibleCodeblocks := Dictionary newFromKeys: #(isEvaluated isTestDefinition isMethodDefinition isClassDefinition)
							      	 		  andValues:#((super visitCodeblock:) visitCodeblockTestDefinition: 															                                                 visitCodeblockMethodDefinition: visitCodeblockClassDefinition:).
	allTestResults := OrderedCollection new.
	checkAll := false.
	workingDirectory := FileLocator home.
