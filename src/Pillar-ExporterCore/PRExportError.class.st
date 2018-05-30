"
I'm an exception class representing errors that happens while exporting a pillar document.
"
Class {
	#name : #PRExportError,
	#superclass : #PRError,
	#instVars : [
		'file'
	],
	#category : 'Pillar-ExporterCore-Exceptions'
}

{ #category : #accessing }
PRExportError >> inputFile: aFile [
	file := aFile
]

{ #category : #accessing }
PRExportError >> messageText [
	^ String
		streamContents: [ :stream | 
			stream << super messageText.
			file ifNotNil: [ stream << ' (' << file basename << ')' ] ]
]
