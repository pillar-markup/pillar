helpers
createLinkToLabelWithAlias: anInternalLink
	canvas command
		name: 'hyperlink';
		parameter: [ canvas raw: anInternalLink anchor ];
		parameter: [ canvas raw: anInternalLink alias ]