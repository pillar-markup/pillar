tests
testFirstLineDefine
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: self firstLine + 1 yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: self middleCode , self endingCode)
						fromFile: 'code.st';
						firstLine: self firstLine + 1 yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected