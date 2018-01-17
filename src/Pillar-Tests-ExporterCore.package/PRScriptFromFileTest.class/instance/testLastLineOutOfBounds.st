tests
testLastLineOutOfBounds
	| input |
	input := PRDocument new
		add:
				((PRCodeblock content: '')
						fromFile: 'code.st';
						lastLine: 500 yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRPropertyError