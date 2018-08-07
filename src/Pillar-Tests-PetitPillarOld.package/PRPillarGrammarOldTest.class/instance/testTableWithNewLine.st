tests - Table
testTableWithNewLine
	self
		parse:
			'|! Foo |! Bar
| Foo2 | Bar2
'
		rule: #table