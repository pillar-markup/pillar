visiting-document
writeTableColumnAlignment: aTableCell
	"https://docs.gitlab.com/ee/user/markdown.html#tables"

	aTableCell isAlignedLeft | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ].
	canvas raw: '---'.
	aTableCell isAlignedRight | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ]