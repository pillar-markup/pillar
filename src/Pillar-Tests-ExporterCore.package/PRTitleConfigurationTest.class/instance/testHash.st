tests
testHash
	| headerConfig |
	headerConfig := self newDefaultConfiguration.
	self assert: headerConfig hash equals: headerConfig copy hash.
	self assert: headerConfig hash = self newDefaultConfiguration hash