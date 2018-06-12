tests - Script
testScriptTwoParametersNoValue
	super testScriptTwoParametersNoValue.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'foo' put: true;
				at: 'bar' put: true;
				yourself)