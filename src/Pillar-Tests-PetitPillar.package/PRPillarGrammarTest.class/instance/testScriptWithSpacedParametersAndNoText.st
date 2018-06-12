tests - Script
testScriptWithSpacedParametersAndNoText
	self
		parse:
			'[[[ foo = true | bar = 2 

]]]'
		rule: #script