Extension { #name : 'PRTable' }

{ #category : '*Pillar-ExporterLaTeX' }
PRTable >> latexSpecification [
	^ String new: self columnCount withAll: $l
]
