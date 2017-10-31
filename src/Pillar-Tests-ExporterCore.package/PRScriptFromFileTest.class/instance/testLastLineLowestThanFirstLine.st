tests
testLastLineLowestThanFirstLine
	| input |
	input := PRDocument new
		add:
				((PRScript content: '')
						fromFile: 'code.st';
						firstLine: 5;
						lastLine: 0 yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError