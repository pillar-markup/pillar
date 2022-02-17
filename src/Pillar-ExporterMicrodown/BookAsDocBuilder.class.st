Class {
	#name : #BookAsDocBuilder,
	#superclass : #Object,
	#instVars : [
		'metadata'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #stuff }
BookAsDocBuilder >> bookFiles [

	^ PRInputFileFinder 
		fromFileIndex: self fileIndex; files
]

{ #category : #stuff }
BookAsDocBuilder >> fileIndex [
	"self new readingTitle"

	| folder index | 
	folder := '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks2/Booklet-PharoWithStyle' asFileReference.
	index := folder asFileReference children detect: [ :f | f extension = 'pillar' ]. 
	PRPillarParser parse: index contents
]

{ #category : #stuff }
BookAsDocBuilder >> loadMetaData [
	"self new readingTitle"
	
	| folder | 
	folder := '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks2/Booklet-PharoWithStyle' asFileReference.
	metadata := STON fromStream: (folder / 'pillar.conf') readStream.


]

{ #category : #stuff }
BookAsDocBuilder >> title [ 
	^ metadata at: #title ifAbsent: [ 'Strange there is no title' ]
]
