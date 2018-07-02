initialization
initialize

	super initialize.
	codeblockDict := Dictionary newFromKeys: #(#isEvaluated #isTestcase #isTestDefinition #isMethodDefinition #isClassDefinition)
							      	 		  andValues:#(#evaluate:
															  #visitCodeBlockTestcase:
															  #visitCodeblockTestDefinition:														                                        												                                                 #visitCodeblockMethodDefinition:
															  #visitCodeblockClassDefinition:).
	allTestResults := OrderedCollection new.
	checkAll := false.
	workingDirectory := FileLocator home.
