"
These are commands that are applicable on a file.
"
Class {
	#name : #GTHighlightingCommand,
	#superclass : #Object,
	#instVars : [
		'start',
		'stop'
	],
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #execute }
GTHighlightingCommand >> executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference [
	self subclassResponsibility 
]

{ #category : #accessing }
GTHighlightingCommand >> start [
	^ start
]

{ #category : #accessing }
GTHighlightingCommand >> start: anObject [
	start := anObject
]

{ #category : #accessing }
GTHighlightingCommand >> stop [
	^ stop
]

{ #category : #accessing }
GTHighlightingCommand >> stop: anObject [
	stop := anObject
]
