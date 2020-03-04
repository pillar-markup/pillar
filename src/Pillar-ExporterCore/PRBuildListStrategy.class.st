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
	files := aCollection asSet
]

{ #category : #accessing }
PRBuildListStrategy >> filesToBuildOn: aProject [

	^ files collect: [ :file | 
				PRInputDocument new
					project: aProject;
					file: (aProject baseDirectory resolve: file);
					yourself ]
]
