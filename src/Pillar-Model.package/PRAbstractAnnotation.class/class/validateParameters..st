protected
validateParameters: parameters
	
	| usedKeys  |
	usedKeys := parameters keys. 
	usedKeys isEmpty and: [ self hasParameters ifTrue: [  (PRError signal: 'The annotation ', self tag, 'expect parameters from', self possibleParameters printString, 'and none where given.')]  ].
	
	(usedKeys allSatisfy: [ :each | self possibleParameters includes: each asSymbol ])
		ifFalse: [ PRError
				signal:
					'The key(s) ' , (usedKeys difference: self possibleParameters) printString
						, '  is not valid for the annotation ' , self tag ].
	(self hasParameters not)
		and: [ usedKeys isNotEmpty ifTrue: [  (PRError signal: 'The annotation ', self tag, ' does not expect parameter') ]]
	