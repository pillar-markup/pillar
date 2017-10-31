visiting-document
visitDocumentItem: anItem
	self add: anItem toCurrentEnvironmentOr: [ super visitDocumentItem: anItem ]