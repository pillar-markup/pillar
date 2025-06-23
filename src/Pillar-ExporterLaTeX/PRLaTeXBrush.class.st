"
A LaTeX brush
"
Class {
	#name : 'PRLaTeXBrush',
	#superclass : 'PRExportBrush',
	#category : 'Pillar-ExporterLaTeX',
	#package : 'Pillar-ExporterLaTeX'
}

{ #category : 'accessing' }
PRLaTeXBrush >> optParameter: aString [ 
	stream
		<< $[
		<< aString
		<< $]
]

{ #category : 'accessing' }
PRLaTeXBrush >> parameter: aString [ 
	stream
		<< ${
		<< aString
		<< $}
]
