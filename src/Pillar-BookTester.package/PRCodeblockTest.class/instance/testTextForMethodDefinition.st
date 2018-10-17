tests
testTextForMethodDefinition

	| cb collection |
	collection := (Array with: 'PRCodeblockTestResults').
	cb  := PRCodeblock content:'PRCodeblockTestResults >> testTextForMethodDefinition
^ ''testTextForMethodDefinition'''parameters: (OrderedDictionary newFromKeys: #('methodDefinition') andValues: #(true)).
	self assert: cb textForMethodDefinition equals: (Array with: collection with: 'testTextForMethodDefinition' with: '^ ''testTextForMethodDefinition''')