helpers
createLinkToLabelWithoutAlias: anInternalLink
	canvas command
		name: 'ref';
		parameter: [ canvas raw: anInternalLink anchor ]