building suites
buildSuiteFromMethods: testMethods

	| testCases suite |
	testCases := testMethods flatCollect: [ :each |
		self testCasesForSelector: each ].
	suite := self suiteClass named: self name asString.
	testCases do: [ :each | suite addTest: each ].
	^ suite