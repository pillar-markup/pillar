initialization
initialize

	super initialize.
	codeblockDict := Dictionary newFromKeys: #(#isEvaluated 
															#isExample  
															#isMethodDefinition 
															#isClassDefinition)
							      	 		  andValues:#(#evaluate:
															  #visitCodeblockExample:														                                      		     							  #visitCodeblockMethodDefinition:
															  #visitCodeblockClassDefinition:).
	allTestResults := OrderedCollection new.
	workingDirectory := FileLocator home.
