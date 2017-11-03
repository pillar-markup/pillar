activation
requestedProperty

	"We expect an argument without -.
	That argument will be the name of the attribute to introspect."
	| args |
	args := commandLine arguments reject: [ :each | each beginsWith: '-' ].
	^ args first.