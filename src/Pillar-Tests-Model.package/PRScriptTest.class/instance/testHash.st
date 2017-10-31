tests-comparing
testHash
	| a b |
	a := self actualClass content: 'foo'.
	b := self actualClass content: 'foo'.
	self assert: a hash = a copy hash.
	self assert: a hash = b hash