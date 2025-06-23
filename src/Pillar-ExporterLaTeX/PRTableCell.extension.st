Extension { #name : 'PRTableCell' }

{ #category : '*Pillar-ExporterLaTeX' }
PRTableCell >> latexAlignment [
	self isAlignedCenter ifTrue: [ ^ 'c' ].
	self isAlignedRight ifTrue: [ ^ 'r' ].
	^ 'l'
]
