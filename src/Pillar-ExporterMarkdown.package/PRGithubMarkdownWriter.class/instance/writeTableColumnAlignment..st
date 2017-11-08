visiting-document
writeTableColumnAlignment: aTableCell
	"https://github.github.com/gfm/#tables-extension-"

	aTableCell isAlignedLeft | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ].
	canvas raw: '---'.
	aTableCell isAlignedRight | aTableCell isAlignedCenter
		ifTrue: [ canvas raw: ':' ]