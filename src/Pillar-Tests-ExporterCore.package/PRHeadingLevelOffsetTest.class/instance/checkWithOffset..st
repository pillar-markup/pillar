tests
checkWithOffset: offset
	| result input configuration |
	configuration := self configuration.
	configuration headingLevelOffset: offset.
	input := PRHeader new
		level: 3;
		add: (PRText content: 'a title');
		yourself.
	result := self executePhase: input with: configuration.
	self assert: result level equals: offset + 3