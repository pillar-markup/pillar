visiting-document
visitHeader: aHeader
	"http://spec.commonmark.org/0.28/#atx-headings"

	| level |
	level := aHeader level min: 6 max: 1.
	1 to: level do: [ :each | canvas nextPut: $# ].
	canvas nextPut: Character space.
	self writeCounterForHeader: aHeader.
	canvas raw: aHeader text trimmed.
	canvas newLine