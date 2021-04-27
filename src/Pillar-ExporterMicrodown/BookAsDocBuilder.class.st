Class {
	#name : #BookAsDocBuilder,
	#superclass : #Object,
	#instVars : [
		'metadata'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'as yet unclassified' }
BookAsDocBuilder >> bookFiles [

	^ PRInputFileFinder new 
		fromIndexFile: self fileIndex; files
]

{ #category : #'as yet unclassified' }
BookAsDocBuilder >> fileIndex [

	"self new readingTitle"
	| folder index | 
	folder := '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks2/Booklet-PharoWithStyle' asFileReference.
	index := folder asFileReference children detect: [ :f | f extension = 'pillar' ]. 
	PRPillarParser parse: index contents
]

{ #category : #'as yet unclassified' }
BookAsDocBuilder >> loadMetaData [
	"self new readingTitle"
	| folder | 
	folder := '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks2/Booklet-PharoWithStyle' asFileReference.
	metadata := STON fromStream: (folder / 'pillar.conf') readStream.


]

{ #category : #'as yet unclassified' }
BookAsDocBuilder >> title [ 
	^ metadata at: #title ifAbsent: [ 'Strange there is no title' ]
]
