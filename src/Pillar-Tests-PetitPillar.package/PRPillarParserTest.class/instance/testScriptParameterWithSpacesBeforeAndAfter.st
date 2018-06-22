tests - Script
testScriptParameterWithSpacesBeforeAndAfter
	super testScriptParameterWithSpacesBeforeAndAfter.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'foo' put: true;
				at: 'bar' put: 2;
				yourself)