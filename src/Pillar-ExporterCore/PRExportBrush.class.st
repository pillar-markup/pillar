"
I'm the superclass of all brushes. A brush is something you can add on a canvas. For example, LaTeX command and environment brushes can be added to a LaTeX canvas; HTML tags can be added to an HTML canvas.
"
Class {
	#name : #PRExportBrush,
	#superclass : #PRBasicObject,
	#instVars : [
		'stream'
	],
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #initialization }
PRExportBrush >> setStream: aStream [
	stream := aStream
]
