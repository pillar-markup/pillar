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
	"select the only file with pillar extension in current directory ; if there is no OR several pillar files, relative error is raised"
	
	| pillarFiles|
	pillarFiles := aProject baseDirectory children select: [ :each | each isFile and: [ each extension = 'pillar' ] ].
	pillarFiles ifEmpty: [ self error: 'There is no pillar file in the repository root.' ].
	pillarFiles size = 1 ifTrue: [ ^ { PRInputDocument new
			project: aProject;
			file: pillarFiles first;
			yourself } ].
	self error: 'There is more than one pillar file in the repository root.'
]
