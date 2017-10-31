tests - Script
testScriptParameters
	super testScriptParameters.
	self
		assert: result
		equals:
			(SmallDictionary new
				at: 'value' put: 'foo';
				yourself)