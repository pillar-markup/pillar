Class {
	#name : #PRBuildListStrategy,
	#superclass : #PRBuildStrategy,
	#instVars : [
		'files'
	],
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #'instance-creation' }
PRBuildListStrategy class >> list: aCollection [ 
	
	^ self new
		files: aCollection;
		yourself
]

{ #category : #accessing }
PRBuildListStrategy >> files: aCollection [ 
	"We first convert the argument into a Set to be sure there is only one occurence of each document, then back to an array to be consistent"
	
	files := aCollection asSet asArray
]

{ #category : #accessing }
PRBuildListStrategy >> filesToBuildOn: aProject [

	^ files collect: [ :file | 
				PRInputDocument new
					project: aProject;
					file: (aProject baseDirectory resolve: file);
					yourself ]
]
