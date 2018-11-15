tests-comparing
testHash
	| a b |
	a := self actualClass content: 'foo'.
	b := self actualClass content: 'foo'.
	self assert: a hash equals: a copy hash.
	self assert: a hash equals: b hash