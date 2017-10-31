visiting-document
visitHeader: aHeader
	aHeader level timesRepeat: [ canvas raw: '=' ].
	canvas space.
	super visitHeader: aHeader.
	canvas newLine