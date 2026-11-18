"
I test the update of the support files of an existing book (`pillar updateArchetype`, `PRArchetype>>updateIn:`): the old `_support` is moved to `_support-previous`, the archetype installs a fresh one, `_custom` is kept or created, and the update reports the files added, changed and removed. The archetype and the book live in a memory file system: the book was made from an older version of the archetype and its author edited `book.css`.
"
Class {
	#name : 'PRArchetypeUpdateTest',
	#superclass : 'TestCase',
	#instVars : [
		'fileSystem',
		'archetype',
		'book'
	],
	#category : 'Pillar-Tests-Project',
	#package : 'Pillar-Tests-Project'
}

{ #category : 'running' }
PRArchetypeUpdateTest >> setUp [

	super setUp.
	fileSystem := FileSystem memory.
	archetype := PRArchetype new
		             name: 'my-archetype';
		             directory: fileSystem / 'archetypes' / 'my-archetype';
		             yourself.
	book := fileSystem / 'book'.
	self
		write: 'archetypes/my-archetype/sample/index.md'
		contents: 'Sample text';
		write: 'archetypes/my-archetype/support/archetypeID'
		contents: 'my-archetype';
		write: 'archetypes/my-archetype/support/html/css/book.css'
		contents: 'new book.css';
		write:
			'archetypes/my-archetype/support/templates/html/main.mustache'
		contents: 'template';
		write: 'archetypes/my-archetype/support/html/css/added.css'
		contents: 'added';
		write: 'archetypes/my-archetype/custom/README.md'
		contents: 'How to customize';
		write: 'book/index.md' contents: 'My text';
		write: 'book/_support/archetypeID' contents: 'my-archetype';
		write: 'book/_support/html/css/book.css'
		contents: 'edited book.css';
		write: 'book/_support/templates/html/main.mustache'
		contents: 'template';
		write: 'book/_support/html/css/removed.css' contents: 'removed'
]

{ #category : 'tests - summary' }
PRArchetypeUpdateTest >> summary [

	^ String streamContents: [ :stream | self update summaryOn: stream ]
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testHiddenFilesAreNotReported [

	| update |
	self
		write: 'book/_support/.DS_Store' contents: 'Finder';
		write: 'archetypes/my-archetype/support/html/.DS_Store'
		contents: 'Finder'.

	update := self update.

	self assert: update removedFiles equals: #( 'html/css/removed.css' ).
	self assert: update addedFiles equals: #( 'html/css/added.css' )
]

{ #category : 'tests - install' }
PRArchetypeUpdateTest >> testInstallCreatesCustom [

	| newBook |
	newBook := fileSystem / 'newBook'.
	newBook ensureCreateDirectory.

	archetype installIn: newBook.

	self
		assert: (newBook / '_custom' / 'README.md') contents
		equals: 'How to customize'.
	self assert:
		(newBook / '_support' / 'html' / 'css' / 'book.css') exists.
	self assert: (newBook / 'index.md') contents equals: 'Sample text'
]

{ #category : 'tests - install' }
PRArchetypeUpdateTest >> testInstallKeepsAnExistingCustom [

	| newBook |
	newBook := fileSystem / 'newBook'.
	(newBook / '_custom' / 'html' / 'css') ensureCreateDirectory.
	newBook / '_custom' / 'html' / 'css' / 'custom.css' writeStreamDo: [
		:stream | stream nextPutAll: 'my rules' ].

	archetype installIn: newBook.

	self
		assert:
		(newBook / '_custom' / 'html' / 'css' / 'custom.css') contents
		equals: 'my rules'.
	self deny: (newBook / '_custom' / 'README.md') exists
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testInstalledArchetypeNameIsReadFromArchetypeID [

	self
		assert: (PRProject on: book) installedArchetypeName
		equals: 'my-archetype'
]

{ #category : 'tests - errors' }
PRArchetypeUpdateTest >> testInstalledArchetypeNameWithoutArchetypeIDRaisesError [

	(book / '_support' / 'archetypeID') delete.

	self
		should: [ (PRProject on: book) installedArchetypeName ]
		raise: PRMissingArchetypeID
]

{ #category : 'tests - summary' }
PRArchetypeUpdateTest >> testSummaryDoesNotMentionAnExistingCustom [

	self write: 'book/_custom/html/css/custom.css' contents: 'my rules'.

	self deny: (self summary includesSubstring: 'Created _custom')
]

{ #category : 'tests - summary' }
PRArchetypeUpdateTest >> testSummaryListsTheFilesToLookAt [

	| summary |
	summary := self summary.

	self assert:
		(summary includesSubstring: '  changed: html/css/book.css').
	self assert:
		(summary includesSubstring: '  removed: html/css/removed.css').
	self deny: (summary includesSubstring: 'added.css')
]

{ #category : 'tests - summary' }
PRArchetypeUpdateTest >> testSummaryNamesTheArchetypeAndCounts [

	self assert: (self summary includesSubstring:
			 'Updated _support from the archetype my-archetype: 1 file added, 1 changed, 1 removed.')
]

{ #category : 'tests - summary' }
PRArchetypeUpdateTest >> testSummaryTellsThatCustomWasCreated [

	self assert: (self summary includesSubstring: 'Created _custom')
]

{ #category : 'tests - summary' }
PRArchetypeUpdateTest >> testSummaryTellsWhenNothingDiffers [

	self
		write: 'book/_support/html/css/book.css' contents: 'new book.css';
		write: 'book/_support/html/css/added.css' contents: 'added'.
	(book / '_support' / 'html' / 'css' / 'removed.css') delete.

	self assert: (self summary includesSubstring:
			 'No file of the previous _support differs from the new one: you can delete _support-previous.')
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateCreatesCustomWhenMissing [

	self assert: self update hasCreatedCustom.
	self
		assert: (book / '_custom' / 'README.md') contents
		equals: 'How to customize'
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateDoesNotChangeTheText [

	self update.

	self assert: (book / 'index.md') contents equals: 'My text'
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateInstallsTheSupportOfTheArchetype [

	self update.

	self
		assert: (book / '_support' / 'html' / 'css' / 'book.css') contents
		equals: 'new book.css'.
	self assert:
		(book / '_support' / 'html' / 'css' / 'added.css') exists.
	self deny:
		(book / '_support' / 'html' / 'css' / 'removed.css') exists
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateKeepsCustom [

	self
		write: 'book/_custom/README.md' contents: 'My notes';
		write: 'book/_custom/html/css/custom.css' contents: 'my rules'.

	self deny: self update hasCreatedCustom.
	self
		assert: (book / '_custom' / 'README.md') contents
		equals: 'My notes'.
	self
		assert: (book / '_custom' / 'html' / 'css' / 'custom.css') contents
		equals: 'my rules'
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateMovesTheOldSupportToSupportPrevious [

	self update.

	self
		assert:
		(book / '_support-previous' / 'html' / 'css' / 'book.css') contents
		equals: 'edited book.css'.
	self assert:
		(book / '_support-previous' / 'html' / 'css' / 'removed.css') exists
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateOfABookWithoutSupportAddsEverything [

	(book / '_support') ensureDeleteAll.

	self assert: self update addedFiles size equals: 4.
	self deny: (book / '_support-previous') exists
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateReplacesAnOlderSupportPrevious [

	self
		write: 'book/_support-previous/old.txt'
		contents: 'from an older update'.

	self update.

	self deny: (book / '_support-previous' / 'old.txt') exists
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateReportsTheAddedFiles [

	self assert: self update addedFiles equals: #( 'html/css/added.css' )
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateReportsTheArchetype [

	self assert: self update archetypeName equals: 'my-archetype'
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateReportsTheChangedFiles [

	self
		assert: self update changedFiles
		equals: #( 'html/css/book.css' )
]

{ #category : 'tests' }
PRArchetypeUpdateTest >> testUpdateReportsTheRemovedFiles [

	self
		assert: self update removedFiles
		equals: #( 'html/css/removed.css' )
]

{ #category : 'helpers' }
PRArchetypeUpdateTest >> update [

	^ archetype updateIn: book
]

{ #category : 'helpers' }
PRArchetypeUpdateTest >> write: aPath contents: aString [
	"Create or replace the file at aPath of the memory file system, with its parent folders."

	| file |
	file := fileSystem root resolve: aPath.
	file parent ensureCreateDirectory.
	file ensureDelete.
	file writeStreamDo: [ :stream | stream nextPutAll: aString ]
]
