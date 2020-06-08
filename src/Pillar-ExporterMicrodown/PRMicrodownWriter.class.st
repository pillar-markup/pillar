Class {
	#name : #PRMicrodownWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting'
	],
	#category : #'Pillar-ExporterMicroDown'
}

{ #category : #accessing }
PRMicrodownWriter >> canvasClass [
	^ PRMicrodownCanvas
]

{ #category : #accessing }
PRMicrodownWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject
]

{ #category : #accessing }
PRMicrodownWriter >> visitBoldFormat: aFormat [
	canvas bold: aFormat text
]

{ #category : #visiting }
PRMicrodownWriter >> visitCommentedLine: aCommentedLine [
	canvas comment: aCommentedLine text
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitExternalLink: anExternalLink [
	canvas externalLink: anExternalLink reference path withDescription: anExternalLink text
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitFigure: aFigure [
	| figureName figureLink |
	figureName := aFigure text.
	figureLink := aFigure reference path.
	canvas figure: figureLink withDescription: figureName.
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitHeader: aHeader [
	| level |
	level := aHeader level min: 6 max: 1.
	canvas header: aHeader text trimmed withLevel: level.
]

{ #category : #accessing }
PRMicrodownWriter >> visitItalicFormat: aFormat [
	canvas italic: aFormat text
]

{ #category : #accessing }
PRMicrodownWriter >> visitMonospaceFormat: aFormat [
	canvas monospace: aFormat text
]

{ #category : #accessing }
PRMicrodownWriter >> visitStrikethroughFormat: aFormat [
	canvas strike: aFormat text
]
