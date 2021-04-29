Class {
	#name : #GTPillarFileHighlightingCommand,
	#superclass : #GTHighlightingCommand,
	#instVars : [
		'fileName'
	],
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #execute }
GTPillarFileHighlightingCommand >> executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference [
	| attribute targetFileReference fileNameWithoutPrefix |
	fileNameWithoutPrefix := self fileName.
	(fileNameWithoutPrefix beginsWith: 'file://') ifTrue: [ 
		fileNameWithoutPrefix := fileNameWithoutPrefix copyFrom: 'file://' size + 1 to: fileNameWithoutPrefix size ].
	targetFileReference := aFileReference parent resolveString: fileNameWithoutPrefix.
	attribute := targetFileReference exists 
		ifTrue: [ GTPillarFileTextLink new
									fileReference: targetFileReference;
									presentation: aPresentation ]
		ifFalse: [ TextColor red ].
	aText 
		addAttribute: attribute
		from: self start 
		to: self stop.
]

{ #category : #accessing }
GTPillarFileHighlightingCommand >> fileName [
	^ fileName
]

{ #category : #accessing }
GTPillarFileHighlightingCommand >> fileName: anObject [
	fileName := anObject
]
