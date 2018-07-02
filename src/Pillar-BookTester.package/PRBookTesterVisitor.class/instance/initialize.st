initialization
initialize

	super initialize.
	codeblockDict := Dictionary newFromKeys: #(isEvaluated isTestDefinition isMethodDefinition isClassDefinition)
							      	 		  andValues:#( ([ :x | x evaluate ])
															  ([ :x | self visitCodeblockTestDefinition: x ])														                                                 ([ :x | self visitCodeblockMethodDefinition: x ])	
															  ([ :x | self visitCodeblockClassDefinition:x ])).
	allTestResults := OrderedCollection new.
	checkAll := false.
	workingDirectory := FileLocator home.
