visiting-annotations
visitDocumentGroup: aGroup
	self add: aGroup toCurrentEnvironmentOr: [ super visitDocumentGroup: aGroup ]