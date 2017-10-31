accessing
referenceAsHTML
	"I return a reference to a pillar file as an html file."

	| ref |
	ref := self reference.
	((ref endsWith: '.pillar') or: [ ref endsWith: '.pier' ])
		ifTrue: [ ref := (ref copyUpToLast: $.) , '.html' ]
		ifFalse: [ PRLinkWarning signal: 'Reference : ' , ref , ' should end with .pillar or .pier' ].
	^ ref