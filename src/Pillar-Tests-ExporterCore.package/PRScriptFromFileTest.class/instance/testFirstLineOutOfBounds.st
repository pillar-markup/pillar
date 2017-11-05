tests
testFirstLineOutOfBounds
	| input |
	input := PRDocument new
		add:
				((PRScript content: '')
						fromFile: 'code.st';
						firstLine: 500 yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError