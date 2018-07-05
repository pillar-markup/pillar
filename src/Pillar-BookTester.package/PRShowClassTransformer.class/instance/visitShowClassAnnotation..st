visiting
visitShowClassAnnotation: aPRShowClassAnnotation
	"Todo classvariableNames + package"
	| className |
	className := self class environment at: (aPRShowClassAnnotation parameters at: #className) asSymbol.
	self replace:(PRCodeblock content: className definition)