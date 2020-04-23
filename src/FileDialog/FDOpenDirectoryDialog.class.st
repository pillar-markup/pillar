"
My responsibility is to provide dialog for selecting Directories.

So no files will be shown in the file/folder listings.

see my super for more information about customization
"
Class {
	#name : #FDOpenDirectoryDialog,
	#superclass : #FDFileDialogPresenter,
	#category : #'FileDialog-UI'
}

{ #category : #specs }
FDOpenDirectoryDialog class >> defaultSpec [
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #bookmarksTreeTable
					withConstraints: [ :contraint | contraint width: 200 ];
				yourself);
		yourself
]

{ #category : #examples }
FDOpenDirectoryDialog class >> example [
	<example>
	^ (self new
		okActionBlock: [ :selectedFileReference | selectedFileReference inspect ])
		openDialogWithSpec inspect
]

{ #category : #api }
FDOpenDirectoryDialog >> initialTitle [
	^ 'Select Directory To Open'
]

{ #category : #initialization }
FDOpenDirectoryDialog >> initializeWidgets [
	super initializeWidgets.
	fileNavigationSystem nameText disable
]

{ #category : #actions }
FDOpenDirectoryDialog >> nameChanged [
	"we don't need to do anything for folder"

	
]

{ #category : #actions }
FDOpenDirectoryDialog >> selectedEntry [
	fileNavigationSystem fileReferenceTable selection selectedItem
		ifNotNil: [ :fileReference | 
			fileReference isDirectory
				ifTrue: [ ^ fileReference ] ].
	self inform: 'you must select a directory'
]
