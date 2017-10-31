helpers
createLinkToLabelWithAlias: anInternalLink
	canvas command
		name: 'hyperref';
		optParameter: [ canvas nextPutAll: anInternalLink anchor ];
		parameter: [ 
					anInternalLink counter isValidCounter
						ifTrue: [ self writeCounter: anInternalLink counter ].
					canvas nextPutAll: anInternalLink alias ]