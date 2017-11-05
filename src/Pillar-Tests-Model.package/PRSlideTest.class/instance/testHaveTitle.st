tests
testHaveTitle
	| slide |
	slide := self actualClass titled: 'Foo'.
	self assert: slide title equals: 'Foo'