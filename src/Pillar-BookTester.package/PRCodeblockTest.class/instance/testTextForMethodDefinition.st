tests
testTextForMethodDefinition

	| cb collection |
	collection := (Array with: 'PRCodeblockTestResults').
	cb  := PRCodeblock content:'PRCodeblockTestResults >> testTextForMethodDefinition
^ ''testTextForMethodDefinition'''parameters: (OrderedDictionary newFromPairs: { 'methodDefinition' . true }).
	self assert: cb textForMethodDefinition equals: (Array with: collection with: 'testTextForMethodDefinition' with: '^ ''testTextForMethodDefinition''')