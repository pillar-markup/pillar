tests
testScriptWithSeveralLineNumbers
	
	| input expected |
	self skip.
	input := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''
 world
 !')
						lineNumber: true;
						eval: false;
						yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: '1	stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''
2	world
3 	!')
						lineNumber: true;
						eval: false;
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) children first text  equals: expected children first text 