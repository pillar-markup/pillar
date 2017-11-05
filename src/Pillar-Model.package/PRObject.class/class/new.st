instance creation
new
	"Create a new instance of this class and checks if it isn't abstract."

	self isAbstract
		ifTrue: [ self error: self name , ' is abstract.' ].
	^ super new