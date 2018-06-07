Class {
	#name : #PRBuildAllStrategy,
	#superclass : #PRBuildStrategy,
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #'instance-creation' }
PRBuildAllStrategy class >> on: aPRProject [ 
	
	^ self new
		project: aPRProject;
		yourself
]

{ #category : #accessing }
PRBuildAllStrategy >> filesToBuildOn: aProject [
	
	| children |
	children := aProject baseDirectory children reject: [ :maybeExcludedDirectory |
		self shouldExcludeDirectory: maybeExcludedDirectory ].

	^ children flatCollect: [ :each |
		each allChildren
			select: [ :file | file isFile and: [ file extension = 'pillar' ] ]
			thenCollect: [ :file | 
				PRInputDocument new
					project: aProject;
					file: file;
					yourself ] ]
]

{ #category : #'private - testing' }
PRBuildAllStrategy >> shouldExcludeDirectory: aFileReference [ 
	
	^ aFileReference basename beginsWithAnyOf: #( '.' '_' )
]
