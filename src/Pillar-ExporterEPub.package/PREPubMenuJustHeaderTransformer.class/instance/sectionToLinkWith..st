private
sectionToLinkWith: aHeader
	| headerLevel |
	headerLevel := aHeader level - 1.
	[ (currentsArray at: headerLevel) isNil ] whileTrue: [ headerLevel := headerLevel - 1 ].
	^ currentsArray at: headerLevel