tests
testPrintElement
	| printer |
	printer := self newDefaultConfiguration.
	self assert:  (String streamContents: [:s | (printer printElement: -1 on: s)]) equals: ''.
	self assert:  (String streamContents: [:s | (printer printElement: 1 on: s)]) equals: self representationOfOne.
	self assert: (String streamContents: [:s | (printer printElement: 26 on: s)])equals: self representationOf26.
	self assert: (String streamContents: [:s | (printer printElement: 27 on: s)]) equals: self representationOf27.
