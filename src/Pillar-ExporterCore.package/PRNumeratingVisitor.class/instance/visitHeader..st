visiting-document
visitHeader: aHeader
	| aLevel |
	aLevel := aHeader level.
	(self needNumbering: aHeader)
		ifTrue: [ headerCounter incrementAt: aLevel ]
		ifFalse: [ headerCounter dontIncrementAt: aLevel ].
	aHeader level = topLevelNumerate
		ifTrue: [ 
			figureCounter incrementAt: 1.
			scriptCounter incrementAt: 1 ].	"Figures and scripts are numbered based on the top-level header. This means that figures and scripts always have 2 numbers: one indicating the header they are in, and one indicating the position of the element in the corresponding section"
	aHeader counter: headerCounter current