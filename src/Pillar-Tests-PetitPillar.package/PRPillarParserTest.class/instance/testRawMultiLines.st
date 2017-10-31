tests - Text
testRawMultiLines
	super testRawMultiLines.
	self assert: result equals: (PRRaw content: 'foo
bar')