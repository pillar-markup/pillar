tests - Script
testScriptWithNewLine
	self
		parse:
			'[[[
foo
]]]
'
		rule: #script