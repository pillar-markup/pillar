visiting-document
visitHeader: aHeader
	canvas tag
		name: 'li';
		with: [ canvas tag
				name: 'a';
				parameterAt: 'href' put: (self refFor: aHeader);
				with: [ self visitDocumentGroup: aHeader ] ]