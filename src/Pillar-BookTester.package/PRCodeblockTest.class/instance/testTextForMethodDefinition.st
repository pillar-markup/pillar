tests
testTextForMethodDefinition

	| cb |
	cb := PRCodeblock content:'PRCodeblockTestResults >> testTextForMethodDefinition
^ ''testTextForMethodDefinition'''parameters: (OrderedDictionary newFromKeys: #('methodDefinition') andValues: #(true)).
	self assert: cb textForMethodDefinition equals: #('PRCodeblockTestResults' 'testTextForMethodDefinition' '^ ''testTextForMethodDefinition''')