error handling
missingAnnotationParametersIn: anAnnotation
	PRSyntaxError signal: 'The annotation ', anAnnotation tag, 
		'expect parameters from', anAnnotation class possibleParameters printString, 
		'and none where given.'