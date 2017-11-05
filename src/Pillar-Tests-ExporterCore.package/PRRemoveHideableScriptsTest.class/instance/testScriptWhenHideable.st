tests
testScriptWhenHideable
	| input expected |
	input := PRDocument new 
		add: ((PRScript content: 'Object') 
					hideable: true;
					yourself);
				yourself.
	expected := PRDocument new.
	self assert: (self executePhase: input with: self configuration) equals: expected