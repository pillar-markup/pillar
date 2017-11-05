private
internalLinkWillBeRender: anInternalLink
	(anInternalLink hasReference and: [ anInternalLink hasAnchor not ])
		ifTrue: [ 
			PRLinkWarning
				signal:
					'Your inter-file link will not be render because you export without separate output files. If you want your link to be render add an anchor to the beginning of your file.' ]