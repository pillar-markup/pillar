"
I'm a command use to add bookmark
"
Class {
	#name : #FDAddBookmarkCommand,
	#superclass : #CmCommand,
	#category : #'FileDialog-Menu'
}

{ #category : #hooks }
FDAddBookmarkCommand >> canBeRun [
	^ self context fileNavigationSystem fileReferenceTable selection selectedItem
		isDirectory
]

{ #category : #hooks }
FDAddBookmarkCommand >> execute [
	| fileReference |
	fileReference := self context fileNavigationSystem fileReferenceTable selection
		selectedItem.
	self context bookmarks
		add:
			(FDBookmark
				name: fileReference basename
				location: fileReference
				icon: nil).
	self context bookmarksTreeTable roots: self context bookmarks
]

{ #category : #initialization }
FDAddBookmarkCommand >> initialize [
	super initialize.
	self
		basicName: 'add bookmark';
		basicDescription: 'add the selected file to the bookmarks'
]
