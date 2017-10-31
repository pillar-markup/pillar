tests
testTransformExerciseStructure
	| input expected |
	input := PRDocument new
		add:
			(PRStructure new
				tag: 'exercise';
				structDict: (Dictionary with: 'question' -> 'question ?' with: 'answer' -> '42')).
	expected := PRDocument new
		add:
			(PRDefinitionList new
				add: (PRTermItem with: (PRText new text: 'question'));
				add: (PRDataItem with: (PRText new text: 'question ?'));
				add: (PRTermItem with: (PRText new text: 'answer'));
				add: (PRDataItem with: (PRText new text: '42'));
				yourself).
	self assert: (self executePhase: input with: self configuration) equals: expected