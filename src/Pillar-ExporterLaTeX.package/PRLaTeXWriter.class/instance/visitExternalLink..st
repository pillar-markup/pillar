visiting-document
visitExternalLink: anExternalLink
	| text reference |
	reference := anExternalLink localFileOrExternalReference.
	text := anExternalLink text.
	(text isEmptyOrNil or: [ reference = text ])
		ifTrue: [ canvas command
				name: 'url';
				parameter: reference ]
		ifFalse: [
			canvas command
				name: 'href';
				parameter: reference;
				parameter: [ canvas nextPutAll: text ].
			canvas command
				name: 'footnote';
				parameter: [ canvas command name: 'url'; parameter: (self protectUrl: reference) ] ]