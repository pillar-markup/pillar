tests - Script
testScriptParameterWithLiteralArray
	self
		parse:
			'[[[foo=#(1 2 true)
bar
]]]'
		rule: #script