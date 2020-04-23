"
I override methods related to opening a file dialog to use my own file dialog instead of the system's one.

To use me by default, see class-side.
"
Class {
	#name : #FDMorphicUIManager,
	#superclass : #MorphicUIManager,
	#category : #'FileDialog-UI'
}

{ #category : #public }
FDMorphicUIManager class >> beDefault [
	<script>
	self new beDefault
]

{ #category : #'ui requests' }
FDMorphicUIManager >> chooseDirectory: label from: dir [
	self flag: #ToDoWhenIntegration.
	self flag: 'use chooseDirectory:path: instead of this'.
	^ FDOpenDirectoryDialog new
		defaultFolder: dir;
		title: (label ifNil: [ 'Choose Directory' translated ]);
		openDialogWithSpec
]

{ #category : #'ui requests' }
FDMorphicUIManager >> chooseDirectory: label path: path [
	^ FDOpenDirectoryDialog new
		defaultFolder: path;
		title: (label ifNil: [ 'Choose Directory' translated ]);
		openDialogWithSpec
]

{ #category : #'ui requests' }
FDMorphicUIManager >> chooseFileMatching: patterns label: label [
	self deprecated: 'now you have to give a filter see FileDialog-filterStrategie'.
	^ FDOpenFileDialog new
		title: (label ifNil: [ 'Choose File' translated ]);
		"fileFilters: pattern  ;"
		openWithSpec
]

{ #category : #'ui requests' }
FDMorphicUIManager >> chooseFileName: title extensions: exts path: path preview: preview [
	self
		deprecated: 'now you have to give a filter see FileDialog-filterStrategie'.
	^ (FDOpenFileDialog new
		title: (title ifNil: [ 'Choose File' translated ]);
		"fileFilters: (exts ifNil: [ #() ] ifNotNil: [ :e | e collect: [ :each | '*.' , each ] ]);"
			defaultFolder: path;
			previewer: preview;
		openDialogWithSpec) ifNotNil: #basename
]

{ #category : #'ui requests' }
FDMorphicUIManager >> chooseFullFileName: title extensions: exts path: path preview: preview [
	self
		deprecated: 'now you have to give a filter see FileDialog-filterStrategie'.
	^ (FDOpenFileDialog new
		title: (title ifNil: [ 'Choose File' translated ]);
		"fileFilters: (exts ifNil: [ #() ] ifNotNil: [ :e | e collect: [ :each | '*.' , each ] ]);"
			defaultFolder: path;
			previewer: preview;
		openDialogWithSpec) ifNotNil: #fullName
]

{ #category : #'ui requests' }
FDMorphicUIManager >> chooseFullFileNameMatching: patterns label: title [
	self
		deprecated: 'now you have to give a filter see FileDialog-filterStrategie'.
	^ FDOpenFileDialog new
		title: (title ifNil: [ 'Choose File' translated ]);
		"fileFilters: (patterns ifNil: [ #() ] ifNotNil: [ :e | e collect: [ :each | '*.' , each ] ]);
		"
			openDialogWithSpec
]

{ #category : #'ui requests' }
FDMorphicUIManager >> fileOpen: title extensions: exts path: path preview: preview [
	self
		deprecated: 'now you have to give a filter see FileDialog-filterStrategie'.
	^ (FDOpenFileDialog new
		title: (title ifNil: [ 'Choose File' translated ]);
		"fileFilters: (exts ifNil: [ #() ] ifNotNil: [ :e | e collect: [ :each | '*.' , each ] ]);
		"defaultFolder: path;
		previewer: preview;
		openModal) ifNotNil: #readStream
]

{ #category : #'ui requests' }
FDMorphicUIManager >> fileSave: title extensions: exts path: path [
	self
		deprecated: 'now you have to give a filter see FileDialog-filterStrategie'.
	^ FDSaveFileDialog new
		title: (title ifNil: [ 'Choose File' translated ]);
		"fileFilters: (exts ifNil: [ #() ] ifNotNil: [ :e | e collect: [ :each | '*.' , each ] ]);
		"
			defaultFolder: path;
		openDialogWithSpec
]
