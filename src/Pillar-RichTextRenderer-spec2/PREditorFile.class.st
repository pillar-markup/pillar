"
I am an abstract PREditorFile, to distinguish a **new** text file and an existing **opened** text file.
"
Class {
	#name : #PREditorFile,
	#superclass : #Object,
	#instVars : [
		'file'
	],
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PREditorFile >> basename [
	self subclassResponsibility 
]

{ #category : #accessing }
PREditorFile >> file [
	^ file
]

{ #category : #accessing }
PREditorFile >> file: aFile [
	file := aFile
]

{ #category : #accessing }
PREditorFile >> fullName [
	self subclassResponsibility 
]

{ #category : #testing }
PREditorFile >> isNew [
	self subclassResponsibility 
]

{ #category : #action }
PREditorFile >> save: aText withExtension: anExtension [
	^ self subclassResponsibility 
]
