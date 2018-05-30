Class {
	#name : #PRStructureTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRStructureTransformerTest >> actualClass [
	^PRStructureTransformer 
]

{ #category : #tests }
PRStructureTransformerTest >> testTransformExerciseStructure [
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
]

{ #category : #tests }
PRStructureTransformerTest >> testTransformWithTwoStructure [
	| input expected |
	input := PRDocument new
	add:
			(PRStructure new
				tag: 'exercise';
				structDict: (Dictionary with: 'question' -> 'question ?' with: 'answer' -> '42'));
		add:
			(PRStructure new
				tag: 'country';
				structDict: (Dictionary with: 'name' -> 'Zimbabwe'));
		yourself.		
	expected := PRDocument new
		add:
			(PRDefinitionList new
				add: (PRTermItem with: (PRText new text: 'question'));
				add: (PRDataItem with: (PRText new text: 'question ?'));
				add: (PRTermItem with: (PRText new text: 'answer'));
				add: (PRDataItem with: (PRText new text: '42'));
				yourself);
		add:
			(PRTable new
				add:
					(PRTableRow new
						add: (PRTableCell with: (PRText new text: 'name'));
						add: (PRTableCell with: (PRText new text: 'Zimbabwe'));
						yourself));
		yourself.
	self
		assert: (self executePhase: input with: self configuration)
		equals: expected
]
