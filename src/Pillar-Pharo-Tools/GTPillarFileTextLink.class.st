Class {
	#name : #GTPillarFileTextLink,
	#superclass : #TextAction,
	#instVars : [
		'fileReference',
		'presentation'
	],
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #accessing }
GTPillarFileTextLink >> fileReference: aFileReference [
	fileReference := aFileReference 
]

{ #category : #accessing }
GTPillarFileTextLink >> presentation [
	^ presentation
]

{ #category : #accessing }
GTPillarFileTextLink >> presentation: anObject [
	presentation := anObject
]

{ #category : #evaluating }
GTPillarFileTextLink >> rubActOnClick: anEvent for: anObject in: paragraph editor: editor [
	self presentation selection: fileReference.
	^ true
]
