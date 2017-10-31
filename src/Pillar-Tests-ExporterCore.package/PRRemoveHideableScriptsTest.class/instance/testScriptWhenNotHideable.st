tests
testScriptWhenNotHideable
	| input |
	input := PRDocument new 
		add: ((PRScript content: 'Object') 
					hideable: false;
					yourself);
				yourself.
	self assert: (self executePhase: input with: self configuration) equals: input