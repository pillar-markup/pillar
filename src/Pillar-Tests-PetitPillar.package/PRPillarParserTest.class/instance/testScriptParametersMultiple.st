tests - Script
testScriptParametersMultiple
	super testScriptParametersMultiple.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo';
				at: 'bar' put: true;
				yourself)