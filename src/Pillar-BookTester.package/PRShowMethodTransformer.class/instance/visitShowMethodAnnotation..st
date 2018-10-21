visiting
visitShowMethodAnnotation: aPRShowMethodAnnotation
	
	| shownClass methodName methodDefinition |
	shownClass := self class environment at: aPRShowMethodAnnotation shownClassName ifAbsent: [nil].
	methodName := aPRShowMethodAnnotation shownMethodName.

	shownClass isNil
		ifTrue: [ methodDefinition := 'The system was looking for ', aPRShowMethodAnnotation shownClassName, ' but did not find it' ]
		ifFalse: [
	methodDefinition := (shownClass canUnderstand: methodName)
		ifFalse: [ 'The system was looking for ', aPRShowMethodAnnotation shownClassName, ' but did not find the method ', methodName ]
		ifTrue: [ (shownClass asString, ' >> ', (shownClass compiledMethodAt: methodName) sourceCode) ]].
	
	self replace: {(PRCodeblock 
								content: methodDefinition 
					  			parameters: (OrderedDictionary new add: 'methodDefinition' -> true; yourself))}