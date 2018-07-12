visiting
visitShowClassAnnotation: aPRShowClassAnnotation
	"Todo classvariableNames + package"
	| className |
	className := self class environment at: (aPRShowClassAnnotation parameters at: #class) asSymbol.
	self replace: {(PRCodeblock content: className definition parameters: (OrderedDictionary new 
																									add: 'classDefinition' -> true;
																									yourself))}