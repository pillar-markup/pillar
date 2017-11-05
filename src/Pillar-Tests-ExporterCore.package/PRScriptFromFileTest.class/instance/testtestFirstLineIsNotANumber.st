tests
testtestFirstLineIsNotANumber
	| input |
	input := PRDocument new
		add:
				((PRScript content: '')
						fromFile: 'code.st';
						firstLine: 'foo' yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError