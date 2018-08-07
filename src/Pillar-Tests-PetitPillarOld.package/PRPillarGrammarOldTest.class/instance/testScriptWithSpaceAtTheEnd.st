tests - Script
testScriptWithSpaceAtTheEnd
	self
		parse:
			'[[[
foo
]]]  '
		rule: #script