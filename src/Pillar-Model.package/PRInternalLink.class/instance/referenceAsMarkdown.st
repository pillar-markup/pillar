accessing
referenceAsMarkdown
	"I return a reference to a pillar file as a markdown file."

	| ref |
	ref := self reference.
	((ref endsWith: '.pillar') or: [ ref endsWith: '.pier' ])
		ifTrue: [ ref := (ref copyUpToLast: $.) , '.md' ]
		ifFalse: [ PRLinkWarning signal: 'Reference : ' , ref , ' should end with .pillar or .pier' ].
	^ ref