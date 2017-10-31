tests
testScriptWithoutEval
	| input expected |
	input := PRDocument new
		add:
				((PRScript content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						eval: false;
						yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRScript content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						eval: false;
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected