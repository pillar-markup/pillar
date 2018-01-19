tests
testTransformScriptStructure
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