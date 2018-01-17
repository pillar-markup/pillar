tests
testtestFirstLineIsNotANumber
	| input |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						firstLine: 'foo' yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError