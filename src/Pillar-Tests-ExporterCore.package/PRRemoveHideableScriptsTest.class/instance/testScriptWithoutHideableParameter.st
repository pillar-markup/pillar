tests
testScriptWithoutHideableParameter
	| input |
	input := PRDocument new 
		add: ((PRScript content: 'Object') 
					yourself);
				yourself.
	self assert: (self executePhase: input with: self configuration) equals: input