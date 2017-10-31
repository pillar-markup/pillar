visiting-document
visitTableCell: anObject
	| cellMarkup |
	cellMarkup := self markupFor: anObject.
	canvas raw: cellMarkup.
	anObject isAligned ifTrue: [
		anObject isAlignedLeft ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableLeft ].
		anObject isAlignedCenter ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableCenter ].
		anObject isAlignedRight ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableRight ] ].
	anObject isHeading ifTrue: [ canvas raw: PRPillarParser defaultMarkupTableHeader ].
	self escape: cellMarkup during: [	super visitTableCell: anObject ]