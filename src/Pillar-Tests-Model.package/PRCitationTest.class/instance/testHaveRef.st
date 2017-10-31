tests
testHaveRef

	|citation|
	citation := self actualClass ref: 'foo'.
	self assert: citation ref equals: 'foo'