tests - Script
testScriptParameters
	super testScriptParameters.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo';
				yourself)