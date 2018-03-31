protected
validateParameters: parameters.
	"class or instance side to be seen"
	
	(parameters keys allSatisfy: [:each | self possibleParameters includes: each ])
		ifFalse: [ PRError signal: 'The key(s) ', ( parameters keys difference: self possibleParameters) printString,  '  is not valid for the annotation ', self tag].
		
	
	