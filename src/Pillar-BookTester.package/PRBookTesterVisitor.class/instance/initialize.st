initialization
initialize

	super initialize.
	codeblockDict := Dictionary newFromKeys: #(#isEvaluated 
															#isTestcase 
															#isTestDefinition 
															#isMethodDefinition 
															#isClassDefinition)
							      	 		  andValues:#(#evaluate:
															  #visitCodeblockTestcase:
															  #visitCodeblockTestDefinition:														                                      		     #visitCodeblockMethodDefinition:
															  #visitCodeblockClassDefinition:).
	allTestResults := OrderedCollection new.
	checkAll := false.
	workingDirectory := FileLocator home.
