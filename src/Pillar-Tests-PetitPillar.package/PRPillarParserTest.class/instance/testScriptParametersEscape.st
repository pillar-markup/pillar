tests - Script
testScriptParametersEscape
	super testScriptParametersEscape.
	self
		assert: result
		equals:
			(SmallDictionary new
				at: 'value' put: 'foo|';
				at: 'bar' put: nil;
				yourself)