tests - Script
testScriptParameterWithoutValue
	super testScriptParameterWithoutValue.
	self assert: result equals: #('foo'  nil)