"
I represent a bookmark having location, icon, and a name.
"
Class {
	#name : #FDBookmark,
	#superclass : #FDAbstractBookMark,
	#instVars : [
		'location'
	],
	#category : #'FileDialog-bookMark'
}

{ #category : #'default bookmarks' }
FDBookmark class >> home [
	^ FDBookmark
		name: 'home'
		location: FileLocator home asFileReference
		icon: (self iconNamed: #home)
]

{ #category : #'default bookmarks' }
FDBookmark class >> image [
	^ FDBookmark
		name: 'image directory'
		location: FileLocator imageDirectory asFileReference
		icon: (self iconNamed: #komitterNewSlice)
]

{ #category : #'instance creation' }
FDBookmark class >> name: aName location: aLocation icon: anIcon [
	^ self new
		name: aName;
		location: aLocation;
		icon: anIcon;
		yourself
]

{ #category : #'default bookmarks' }
FDBookmark class >> root [
	^ FDBookmark
		name: 'file system'
		location: FileLocator root asFileReference
		icon: (self iconNamed: #smallWindow)
]

{ #category : #'default bookmarks' }
FDBookmark class >> tmp [
	^ FDBookmark
		name: 'tmp'
		location: FileLocator temp asFileReference
		icon: (self iconNamed: #open)
]

{ #category : #'default bookmarks' }
FDBookmark class >> windowsDrives [
	^ FileLocator root asFileReference directories
		collect: [ :each | 
			FDBookmark
				name: each basename
				location: each
				icon: (self iconNamed: #smallWindow) ]
]

{ #category : #comparing }
FDBookmark >> = aBookmark [
	self species = aBookmark species
		ifFalse: [ ^ false ].
	^ self icon = aBookmark icon & (self location = aBookmark location)
		& (self name = aBookmark name)
]

{ #category : #accessing }
FDBookmark >> children [ 
	^ {  }
]

{ #category : #comparing }
FDBookmark >> hash [
	^ (self icon hash bitXor: self location hash) bitXor: self name hash
]

{ #category : #testing }
FDBookmark >> isComposite [
	^ false
]

{ #category : #accessing }
FDBookmark >> location [
	^ location
]

{ #category : #accessing }
FDBookmark >> location: aFileReference [
	location := aFileReference
]

{ #category : #printing }
FDBookmark >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< '(''';
		<< name;
		<< '''->''';
		<< location fullName;
		<< ''')'
]
