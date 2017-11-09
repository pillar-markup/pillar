building suites
testCasesForSelector: testSelector
	
	| method argumentPossibilities |
	method := self >> testSelector.
	argumentPossibilities := method argumentNames collect: [ :each |
		self allSelectors select: [ :selector | selector beginsWith: each ]  ].
	
	^ (self permutationsOf: argumentPossibilities)
			collect: [ :permutation | 
				self selector: testSelector arguments: permutation ]