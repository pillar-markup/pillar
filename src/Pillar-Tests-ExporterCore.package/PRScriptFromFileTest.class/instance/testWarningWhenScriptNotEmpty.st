tests
testWarningWhenScriptNotEmpty
	| input  |
	input := PRDocument new
		add: ((PRCodeblock content: 'foo') fromFile: 'code.st' yourself);
		yourself.
	self should: [ self executePhase: input with: self configuration ] raise: PRWarning