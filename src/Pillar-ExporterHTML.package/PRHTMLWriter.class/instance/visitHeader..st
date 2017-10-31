visiting-document
visitHeader: aHeader
	| level |
	"h1 to h7 exist."
	level := aHeader level min: 7 max: 1.
	canvas tag
		name: 'h' , level asString;
		with: [ 
					self writeCounterForHeader: aHeader.
					super visitHeader: aHeader ].
	canvas newLine