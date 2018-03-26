tests
testPrintElement
	| printer |
	printer := self newDefaultConfiguration.
	self assert: (printer printElement: -1) equals: ''.
	self assert: (printer printElement: 1) equals: self representationOfOne.
	self assert: (printer printElement: 26) equals: self representationOf26.
	self assert: (printer printElement: 27) equals: self representationOf27