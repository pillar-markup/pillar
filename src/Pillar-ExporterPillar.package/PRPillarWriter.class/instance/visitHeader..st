visiting-document
visitHeader: aHeader
	aHeader level timesRepeat: [ canvas raw: (self markupFor: aHeader) ].
	super visitHeader: aHeader.
	canvas newLine