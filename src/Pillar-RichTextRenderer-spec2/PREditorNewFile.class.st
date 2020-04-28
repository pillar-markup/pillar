Class {
	#name : #PREditorNewFile,
	#superclass : #PREditorFile,
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PREditorNewFile >> basename [ 
	^ 'NewFile'
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
PREditorNewFile >> save: aText [
	| selectedFile |
	selectedFile := FDSaveFileDialog new openModal.
	selectedFile ifNotNil: [ ^ PREditorOpenedFile new file: selectedFile; save: aText; yourself. ]
	
]
