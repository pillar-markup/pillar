tests
testPrintElement
	| headerConfig |
	headerConfig := self newDefaultConfiguration.
	self assert: (headerConfig printElement: -1) equals: ''.
	self assert: (headerConfig printElement: 1) equals: self representationOfOne.
	self assert: (headerConfig printElement: 26) equals: self representationOf26.
	self assert: (headerConfig printElement: 27) equals: self representationOf27