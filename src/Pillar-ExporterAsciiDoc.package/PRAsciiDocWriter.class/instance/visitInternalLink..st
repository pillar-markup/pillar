visiting-document
visitInternalLink: anInternalLink

	|alias|

	alias := 	anInternalLink hasAlias
					ifTrue: [ ',' , anInternalLink alias ]
					ifFalse: [ '' ].

	anInternalLink hasAnchor 
		ifTrue: [ canvas surround: anInternalLink anchor, alias with: '<<' and: '>>']