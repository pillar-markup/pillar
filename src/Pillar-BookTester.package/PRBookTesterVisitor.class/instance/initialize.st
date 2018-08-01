initialization
initialize

	super initialize.
	codeblockDict := Dictionary newFromKeys: #(#isEvaluated 
															#isTestcase  
															#isMethodDefinition 
															#isClassDefinition)
							      	 		  andValues:#(#evaluate:
															  #visitCodeblockTestcase:														                                      		     #visitCodeblockMethodDefinition:
															  #visitCodeblockClassDefinition:).
	allTestResults := OrderedCollection new.
	workingDirectory := FileLocator home.
