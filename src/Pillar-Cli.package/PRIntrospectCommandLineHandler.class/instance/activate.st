activation
activate
	| request args command result |
	"We expect an argument without -.
	That argument will be the name of the attribute to introspect."
	args := commandLine arguments reject: [ :each | each beginsWith: '-' ].
	args isEmpty
		ifTrue: [ ^ self ].
	
	request := args first.
	
	command := PRIntrospectCommand new.
	command configuration: self configuration.
	result := command introspect: request.

	self stdout
		nextPutAll: result asString;
		lf.
	self exitSuccess