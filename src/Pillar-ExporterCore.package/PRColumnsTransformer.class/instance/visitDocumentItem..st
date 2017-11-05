visiting-annotations
visitDocumentItem: anItem
	self add: anItem toCurrentEnvironmentOr: [ super visitDocumentItem: anItem ]