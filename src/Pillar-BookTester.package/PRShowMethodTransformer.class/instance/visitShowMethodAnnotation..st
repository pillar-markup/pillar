visiting
visitShowMethodAnnotation: aPRShowMethodAnnotation
	
	| className methodName |
	className := self class environment at: (aPRShowMethodAnnotation parameters at: #className) asSymbol.
	methodName := (aPRShowMethodAnnotation parameters at: #methodName) asSymbol.
	self replace: (PRCodeblock content: (
	className  asString, ' >> ', methodName asString,'
	', (className methodDict at: methodName asSymbol) sourceCode) 
					  parameters: OrderedDictionary new)