activation
activate
	| result |
	result := self command introspect: self requestedProperty.

	self stdout
		nextPutAll: result asString;
		lf.
	self exitSuccess