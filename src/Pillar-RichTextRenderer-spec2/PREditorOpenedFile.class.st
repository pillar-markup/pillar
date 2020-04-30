Class {
	#name : #PREditorOpenedFile,
	#superclass : #PREditorFile,
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PREditorOpenedFile >> basename [
	^ self file basename
]

{ #category : #accessing }
PREditorOpenedFile >> fullName [
	^ self file fullName
]

{ #category : #testing }
PREditorOpenedFile >> isNew [
	^ false
]

{ #category : #action }
PREditorOpenedFile >> save: aText [
	self file writeStreamDo: [ 
		:str | str nextPutAll: aText text asString; truncate: aText text asString size 
	].
	^ self

]
