visiting
visitShowClassAnnotation: aPRShowClassAnnotation
	"Todo classvariableNames + package"
	| className |
	className := self class environment at: (aPRShowClassAnnotation parameters at: #className) asSymbol.
	^ PRCodeblock content: className definition