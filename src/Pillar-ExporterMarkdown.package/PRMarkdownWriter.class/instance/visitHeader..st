visiting-document
visitHeader: aHeader
	| level |
	level := aHeader level min: 7 max: 1.
	1 to: level do: [ :each | canvas nextPut: $# ].
	self writeCounterForHeader: aHeader.
	canvas raw: aHeader text.
	canvas newLine
	