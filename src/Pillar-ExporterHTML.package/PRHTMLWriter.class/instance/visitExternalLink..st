visiting-document
visitExternalLink: anExternalLink
	canvas tag
		name: 'a';
		parameterAt: 'href' put: anExternalLink localFileOrExternalReference;
		with: anExternalLink alias