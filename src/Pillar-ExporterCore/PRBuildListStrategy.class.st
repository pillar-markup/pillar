"
On the command line we can pass a list of files to be processed: 

```
pillar build pdf file1.pillar file2.pillar
```

Note that there is a bug when using two files.
"
Class {
	#name : 'PRBuildListStrategy',
	#superclass : 'PRBuildStrategy',
	#instVars : [
		'files'
	],
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'instance-creation' }
PRBuildListStrategy class >> list: aCollection [ 
	
	^ self new
		files: aCollection;
		yourself
]

{ #category : 'accessing' }
PRBuildListStrategy >> files: aCollection [ 
	files := aCollection asSet
]

{ #category : 'accessing' }
PRBuildListStrategy >> filesToBuildOn: aProject [
	"Answer the input documents of my files, resolved against the folder of aProject; raise a PRCommandError naming a file that does not exist."

	^ files collect: [ :each |
			  | file |
			  file := aProject baseDirectory resolve: each.
			  file exists ifFalse: [
					  PRCommandError signal: ('The file {1} does not exist.' format:
							   { (aProject displayNameOf: file) }) ].
			  (PRInputDocument forFile: file)
				  project: aProject;
				  yourself ]
]
