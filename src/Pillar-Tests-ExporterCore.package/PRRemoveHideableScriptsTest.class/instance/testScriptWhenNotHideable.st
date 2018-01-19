tests
testScriptWhenNotHideable
	| input |
	input := PRDocument new 
		add: ((PRCodeblock content: 'Object') 
					hideable: false;
					yourself);
				yourself.
	self assert: (self executePhase: input with: self configuration) equals: input