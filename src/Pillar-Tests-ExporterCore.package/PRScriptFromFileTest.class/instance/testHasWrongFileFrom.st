tests
testHasWrongFileFrom
	| input |
	input := PRDocument new
		add: ((PRScript content: '') fromFile: 'wrong.st' yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRInputFileError 