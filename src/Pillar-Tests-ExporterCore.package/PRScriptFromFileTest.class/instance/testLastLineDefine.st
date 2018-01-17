tests
testLastLineDefine
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						lastLine: self firstLine + 3 yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: self headingCode , self middleCode)
						fromFile: 'code.st';
						lastLine: self firstLine + 3 yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected