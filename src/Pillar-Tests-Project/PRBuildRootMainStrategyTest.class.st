"
I test `PRBuildRootMainStrategy`: which file of the root of a book it builds (the default of `pillar build`). Each test writes the root files of a book in a memory file system, so tests leave no file behind.
"
Class {
	#name : 'PRBuildRootMainStrategyTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Tests-Project',
	#package : 'Pillar-Tests-Project'
}

{ #category : 'helpers' }
PRBuildRootMainStrategyTest >> filesOfBookWith: aCollectionOfNames [
	"Answer the names of the files the strategy builds for a book whose root holds files with these names."

	| book |
	book := FileSystem memory / 'book'.
	book ensureCreateDirectory.
	aCollectionOfNames do: [ :each |
		book / each writeStreamDo: [ :stream | stream nextPutAll: 'Text.' ] ].
	^ (PRBuildRootMainStrategy new filesToBuildOn: (PRProject on: book))
		  collect: [ :each | each file basename ]
]

{ #category : 'tests - errors' }
PRBuildRootMainStrategyTest >> testOnlyAReadmeRaisesError [

	self should: [ self filesOfBookWith: #( 'README.md' ) ] raise: Error
]

{ #category : 'tests' }
PRBuildRootMainStrategyTest >> testPillarFileIsNotBuilt [

	self
		assert: (self filesOfBookWith: #( 'index.md' 'old.pillar' )) asArray
		equals: #( 'index.md' )
]

{ #category : 'tests' }
PRBuildRootMainStrategyTest >> testReadmeInLowercaseIsNotBuilt [

	self
		assert: (self filesOfBookWith: #( 'index.md' 'readme.md' )) asArray
		equals: #( 'index.md' )
]

{ #category : 'tests' }
PRBuildRootMainStrategyTest >> testReadmeIsNotBuilt [

	self
		assert: (self filesOfBookWith: #( 'index.md' 'README.md' )) asArray
		equals: #( 'index.md' )
]

{ #category : 'tests' }
PRBuildRootMainStrategyTest >> testSingleIndexIsBuilt [

	self
		assert: (self filesOfBookWith: #( 'index.md' )) asArray
		equals: #( 'index.md' )
]

{ #category : 'tests - errors' }
PRBuildRootMainStrategyTest >> testTwoBookFilesRaiseError [

	self
		should: [ self filesOfBookWith: #( 'index.md' 'book.md' ) ]
		raise: Error
]
