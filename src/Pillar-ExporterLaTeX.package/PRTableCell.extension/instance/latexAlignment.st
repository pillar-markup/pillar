*Pillar-ExporterLaTeX
latexAlignment
	self isAlignedCenter ifTrue: [ ^ 'c' ].
	self isAlignedRight ifTrue: [ ^ 'r' ].
	^ 'l'