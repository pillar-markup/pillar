Class {
	#name : #PRScriptEvaluatorTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRScriptEvaluatorTest >> actualClass [
	^ PRScriptEvaluator 
]

{ #category : #tests }
PRScriptEvaluatorTest >> testScriptWithEvalThatDoesntReturnAParagraph [
	| input expected |
	input := PRDocument new
		add:
			(PRParagraph new
				add:
						((PRCodeblock content: 'stream nextPutAll: ''-test''')
								eval: true; 
								yourself);
				yourself) yourself.
	expected := PRDocument new
		add:
			(PRParagraph new
				add: (PRUnorderedList new add: (PRListItem new add: (PRText content: 'test')));
				yourself) yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptEvaluatorTest >> testScriptWithProblematicEval [
	| input |
	input := PRDocument new
		add:
				((PRCodeblock content: 'Object SomethingThatIsNotAMethod')
						eval: true;
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: input
]

{ #category : #tests }
PRScriptEvaluatorTest >> testScriptWithoutEval [
	| input expected |
	input := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						eval: false;
						yourself);
		yourself.
	expected := PRDocument new
		add:
				((PRCodeblock content: 'stream nextPut: $h; nextPut: $e; nextPut: $l; nextPutAll: ''lo''')
						eval: false;
						yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]
