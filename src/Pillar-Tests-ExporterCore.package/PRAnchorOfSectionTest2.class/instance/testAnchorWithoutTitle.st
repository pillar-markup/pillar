tests
testAnchorWithoutTitle
	| input config |
	config := self configuration.
	input := PRDocument new
		add: (PRText content: 'foo');
		yourself.
	self assert: (self executePhase: input with: config) equals: input