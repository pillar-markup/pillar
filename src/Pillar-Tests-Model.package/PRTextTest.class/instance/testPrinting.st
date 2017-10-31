tests-printing
testPrinting
	| text |
	text := PRText content: 'abcdef'.
	'*abcdef*' match: text printString