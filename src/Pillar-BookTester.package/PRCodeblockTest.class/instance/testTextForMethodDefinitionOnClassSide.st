tests
testTextForMethodDefinitionOnClassSide

	| cb collection |
	collection := (Array with: 'PRCodeblockTestResults' with: 'class').
	cb  := PRCodeblock content:'PRCodeblockTestResults class>> testTextForMethodDefinition
^ ''testTextForMethodDefinition'''parameters: (OrderedDictionary newFromKeys: #('methodDefinition') andValues: #(true)).
	self assert: cb textForMethodDefinition equals: (Array with: collection with: 'testTextForMethodDefinition' with: '^ ''testTextForMethodDefinition''')