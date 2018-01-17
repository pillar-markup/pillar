tests
testScriptWithoutHideableParameter
	| input |
	input := PRDocument new 
		add: ((PRCodeblock content: 'Object') 
					yourself);
				yourself.
	self assert: (self executePhase: input with: self configuration) equals: input