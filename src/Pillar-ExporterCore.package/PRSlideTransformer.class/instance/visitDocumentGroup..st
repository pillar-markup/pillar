visiting-document
visitDocumentGroup: aGroup
	self add: aGroup toCurrentEnvironmentOr: [ super visitDocumentGroup: aGroup ]