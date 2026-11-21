"
I test that Pillar checks the requests of the author and the state of their book before doing any work, and signals a `PRCommandError` whose message says what is wrong and what to do: a missing file, a folder that is not a book, a syntax error in `pillar.conf`, an unknown archetype, an archetype installed in a folder that is not empty, LaTeX that cannot run. The command line prints these messages as `pillar: <message>` (see `ClapPillarCommandErrorTest`).
"
Class {
	#name : 'PRCommandErrorTest',
	#superclass : 'TestCase',
	#instVars : [
		'fileSystem',
		'book'
	],
	#category : 'Pillar-Tests-Project',
	#package : 'Pillar-Tests-Project'
}

{ #category : 'helpers' }
PRCommandErrorTest >> archetypeNamed: aString [

	^ PRArchetype new
		  name: aString;
		  directory: fileSystem / 'archetypes' / aString;
		  yourself
]

{ #category : 'helpers' }
PRCommandErrorTest >> buildHtml: aStrategy [

	(PRProject on: book) build: (PRHtmlOutput new
			 buildStrategy: aStrategy;
			 yourself)
]

{ #category : 'helpers' }
PRCommandErrorTest >> messageOf: aBlock [
	"Answer the message of the PRCommandError aBlock signals."

	^ [
		  aBlock value.
		  self fail: 'No PRCommandError signaled' ]
		  on: PRCommandError
		  do: [ :error | error messageText ]
]

{ #category : 'running' }
PRCommandErrorTest >> setUp [

	super setUp.
	fileSystem := FileSystem memory.
	book := fileSystem / 'book'.
	self
		write: 'book/pillar.conf' contents: '{ "title" : "My Book" }';
		write: 'book/index.md' contents: 'Welcome.';
		write: 'book/_support/templates/html/main.mustache'
		contents: '{{{content}}}';
		write: 'archetypes/alpha/sample/index.md' contents: 'Alpha';
		write: 'archetypes/alpha/sample/pillar.conf' contents: '{ }';
		write: 'archetypes/alpha/support/archetypeID' contents: 'alpha';
		write: 'archetypes/beta/support/archetypeID' contents: 'beta'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testArchetypeInAFolderWithItsFilesCopiesNothing [

	[ (self archetypeNamed: 'alpha') installIn: book ]
		on: PRCommandError
		do: [ :error | error return: nil ].

	self assert: (book / 'index.md') contents equals: 'Welcome.'.
	self deny: (book / '_support' / 'archetypeID') exists
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testArchetypeInAFolderWithItsFilesRaisesError [

	self
		assert:
		(self messageOf: [ (self archetypeNamed: 'alpha') installIn: book ])
		equals:
		'This folder already has index.md, pillar.conf: run pillar archetype in an empty folder. To update the support files of a book, use pillar updateArchetype.'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testBuildingAFileThatIsNotMicrodownRaisesError [

	self write: 'book/old.pillar' contents: 'Old syntax'.

	self
		assert: (self messageOf: [
				 self buildHtml: (PRBuildListStrategy list: #( 'old.pillar' )) ])
		equals:
		'The file old.pillar is not a Microdown file: Pillar builds .md and .mic files.'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testBuildingAFolderWithoutSupportRaisesError [

	(book / '_support') ensureDeleteAll.

	self
		assert:
		(self messageOf: [ self buildHtml: PRBuildRootMainStrategy new ])
		equals:
		'This folder is not a Pillar book: it has no _support folder. Run pillar in the folder of the book, or create a book with pillar archetype <name> (see pillar archetype --help).'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testBuildingAMissingFileRaisesError [

	self
		assert: (self messageOf: [
				 self buildHtml: (PRBuildListStrategy list: #( 'missing.md' )) ])
		equals: 'The file missing.md does not exist.'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testBuildingWithAnUnknownHtmlWriterRaisesError [

	self write: 'book/pillar.conf' contents: '{ "htmlWriter" : #nosuch }'.

	self
		assert:
		(self messageOf: [ self buildHtml: PRBuildRootMainStrategy new ])
		equals:
		'Unknown htmlWriter nosuch in pillar.conf (writers: micbasichtml, michtml).'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testBuildingWithTwoRootFilesRaisesError [

	(book / 'index.md') delete.
	self
		write: 'book/book.md' contents: 'Book';
		write: 'book/other.md' contents: 'Other'.

	self
		assert:
		(self messageOf: [ self buildHtml: PRBuildRootMainStrategy new ])
		equals:
		'There is no index.md and more than one Microdown file in the folder of the book (book.md, other.md): give the one to build, for example pillar build pdf book.md.'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testBuildingWithoutHtmlWriterRaisesError [

	self
		assert:
		(self messageOf: [ self buildHtml: PRBuildRootMainStrategy new ])
		equals:
		'pillar.conf has no htmlWriter: add for example "htmlWriter" : #michtml (writers: micbasichtml, michtml).'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testBuildingWithoutRootFileRaisesError [

	(book / 'index.md') delete.

	self
		assert:
		(self messageOf: [ self buildHtml: PRBuildRootMainStrategy new ])
		equals:
		'There is no Microdown file (such as index.md) in the folder of the book: give the file to build, for example pillar build pdf index.md.'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testCommandThatCannotRunRaisesError [

	OSPlatform current isWindows ifTrue: [
		^ self skip: 'Unix processes only' ].

	self
		assert: (self messageOf: [
					 PRPDFDocument new
						 executeCommand: 'no-such-command-for-pillar'
						 arguments: #(  )
						 workingDirectory: fileSystem root fullName ])
		equals:
		'no-such-command-for-pillar cannot be run: is it installed? To build PDF files, install a TeX distribution (TeX Live, MacTeX) that provides latexmk and lualatex.'
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testSyntaxErrorInPillarConfRaisesError [

	self write: 'book/pillar.conf' contents: '{ "title" : }'.

	self assert:
		((self messageOf: [ self buildHtml: PRBuildRootMainStrategy new ])
			 beginsWith: 'pillar.conf is not valid: ')
]

{ #category : 'tests - errors' }
PRCommandErrorTest >> testUnknownArchetypeRaisesErrorListingTheArchetypes [

	self
		assert:
		(self messageOf: [ (self archetypeNamed: 'gamma') validateExists ])
		equals: 'Unknown archetype gamma. The archetypes are: alpha, beta.'
]

{ #category : 'helpers' }
PRCommandErrorTest >> write: aPath contents: aString [
	"Create or replace the file at aPath of the memory file system, with its parent folders."

	| file |
	file := fileSystem root resolve: aPath.
	file parent ensureCreateDirectory.
	file ensureDelete.
	file writeStreamDo: [ :stream | stream nextPutAll: aString ]
]
