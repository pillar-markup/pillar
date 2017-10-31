visiting-document
visitHeader: aHeader
	canvas tag
		name: 'navLabel';
		with: [ canvas tag
				name: 'text';
				with: [ self visitDocumentGroup: aHeader ] ].
	canvas emptyTag
		name: 'content';
		parameterAt: 'src' put: (self refFor: aHeader);
		closeTag