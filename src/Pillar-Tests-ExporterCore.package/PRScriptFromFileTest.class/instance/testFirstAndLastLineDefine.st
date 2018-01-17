tests
testFirstAndLastLineDefine
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: self firstLine +1;
						lastLine: self firstLine + 3 yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: self middleCode)
						fromFile: 'code.st';
						firstLine: self firstLine +1;
						lastLine: self firstLine + 3 yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected