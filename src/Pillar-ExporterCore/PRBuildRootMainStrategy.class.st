"
I'm a file strategy that identifies the pillar file on the root of the repository: i.e., index.pillar or book.pillar.

I (will be) used when the user types 
	pillar build pdf
"
Class {
	#name : #PRBuildRootMainStrategy,
	#superclass : #PRBuildStrategy,
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRBuildRootMainStrategy >> filesToBuildOn: aProject [ 
	
	| file |
	file := aProject baseDirectory children detect: [ :each | each isFile and: [ each extension = 'pillar' ] ] ifNone: [ self error: 'There is no file pillar on the reposittory root.' ].
	"we should set up an infrastructure to cleaning report problems.
	may via aProject"
	^ { PRInputDocument new
			project: aProject;
			file: file;
			yourself }
	
]
