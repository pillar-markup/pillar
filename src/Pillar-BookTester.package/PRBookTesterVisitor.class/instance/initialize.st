initialization
initialize

	super initialize.
	codeblockDict := Dictionary newFromKeys: #(#isEvaluated #isTestDefinition #isMethodDefinition #isClassDefinition)
							      	 		  andValues:#(#evaluate:
															  #visitCodeblockTestDefinition:														                                        												                                                 #visitCodeblockMethodDefinition:
															  #visitCodeblockClassDefinition:).
	allTestResults := OrderedCollection new.
	checkAll := false.
	workingDirectory := FileLocator home.
