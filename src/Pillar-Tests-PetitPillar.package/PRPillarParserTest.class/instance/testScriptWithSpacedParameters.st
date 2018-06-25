tests - Script
testScriptWithSpacedParameters
	super testScriptWithSpacedParameters.
	self assert: result equals: 
					(PRCodeblock content: 'bla'
									 parameters: (OrderedDictionary new 
															at: 'foo' put: true;
															at: 'bar' put: 2;
															yourself)).
	self assertStart: 1 stop: 33.