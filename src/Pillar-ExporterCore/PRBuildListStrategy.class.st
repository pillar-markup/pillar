"
On the command line we can pass a list of files to be processed: 

```
pillar build pdf file1.pillar file2.pillar
```

Note that there is a bug when using two files.
"
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
				(PRInputDocument forFile: (aProject baseDirectory resolve: file))
					project: aProject;
					yourself ]
]
