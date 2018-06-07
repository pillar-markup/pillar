Class {
	#name : #PRScriptStructureTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRScriptStructureTransformerTest >> actualClass [
	^PRScriptStructureTransformer 
]

{ #category : #tests }
PRScriptStructureTransformerTest >> testTransformScriptStructure [
	| input expected |
	input := PRDocument new
		add:
			((PRCodeblock 
				content:'{"postCode":"59000","name":"Lille"}')
				structureName:'city';
				yourself).
	expected := PRDocument new
		add:
			(PRStructure new
				tag: 'city';
				structDict: (Dictionary with: 'name' -> 'Lille'
												with: 'postCode' -> '59230');
				yourself).
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRScriptStructureTransformerTest >> testTransformScriptStructureWithTwoStructure [
	| input expected |
	input := PRDocument new
		add:
			((PRCodeblock content: '{"name":"Zimbabwe"}')
				structureName: 'country';
				yourself);
		add:
			((PRCodeblock content: '{"name":"Bidon", "postCode":"07034"}')
				structureName: 'city';
				yourself).
	expected := PRDocument new
		add:
			(PRStructure new
				tag: 'country';
				structDict: (Dictionary with: 'name' -> 'Zimbabwe');
				yourself);
		add:
			(PRStructure new
				tag: 'city';
				structDict: (Dictionary with: 'name' -> 'Bidon' with: 'postCode' -> '07034');
				yourself).
	self
		assert: (self executePhase: input with: self configuration)
		equals: expected
]
