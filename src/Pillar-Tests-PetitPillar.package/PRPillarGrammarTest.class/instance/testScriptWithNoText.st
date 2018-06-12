tests - Script
testScriptWithNoText
	self
		parse:
			'[[[foo=true|bar=2 

]]]'
		rule: #script