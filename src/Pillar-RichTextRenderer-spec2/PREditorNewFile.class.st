Class {
	#name : #PREditorNewFile,
	#superclass : #PREditorFile,
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PREditorNewFile >> basename [ 
	^ 'newFile'
]

{ #category : #accessing }
PREditorNewFile >> fullName [
	^ 'New File has no fullname'
]

{ #category : #testing }
PREditorNewFile >> isNew [
	^ true
]

{ #category : #action }
PREditorNewFile >> save: aText withExtension: anExtension [
	| selectedFile |
	selectedFile := FDSaveFileDialog new defaultName: ('my_document.', anExtension asString); openModal.
	selectedFile ifNotNil: [ ^ PREditorOpenedFile new file: selectedFile; save: aText; yourself. ].
	^ self
	
]
