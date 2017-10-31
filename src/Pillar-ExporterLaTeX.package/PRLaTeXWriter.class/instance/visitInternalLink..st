visiting-document
visitInternalLink: anInternalLink
	(anInternalLink reference isNil or: [ self configuration separateOutputFiles not ])
		ifTrue: [ 
			anInternalLink hasAlias
				ifTrue: [ 
					anInternalLink hasAnchor
						ifTrue: [ self createLinkToLabelWithAlias: anInternalLink ]
						ifFalse: [ 
							PRLinkWarning
								signal:
									(PRPillarWriter write: anInternalLink)
										,
											' will not be render because you export without separate output files. If you want your link to be render add an anchor to the beginning of your file.'.
							canvas nextPutAll: anInternalLink alias ] ]
				ifFalse: [ 
					anInternalLink hasAnchor
						ifTrue: [ self createLinkToLabelWithoutAlias: anInternalLink ] ] ]
		ifFalse: [ 
			anInternalLink hasAlias
				ifTrue: [ 
					self flag: #todo.	"If we don't render the link we can put it as Footer. We need to do it."
					canvas nextPutAll: anInternalLink alias ]
				ifFalse: [ 
					PRLinkWarning
						signal:
							(PRPillarWriter write: anInternalLink)
								,
									' will not be exported because LaTeX doesn''t support the inter-files links. Please add an Alias to keep this internal link.' ] ]