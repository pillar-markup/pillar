"
I test how a build applies the `_custom` folder of a book over its `_support` folder: a file of `_custom` replaces the file of `_support` with the same path in the output, other files are added, and `_custom/README.md` is not copied. The templates are read from the merged copy. See `doc/book-layout.md` in the Pillar repository.
"
Class {
	#name : 'PRCustomSupportTest',
	#superclass : 'TestCase',
	#instVars : [
		'book'
	],
	#category : 'Pillar-Tests-Project',
	#package : 'Pillar-Tests-Project'
}

{ #category : 'helpers' }
PRCustomSupportTest >> build [
	"Build index.md of the book as pillar build html does, and answer the folder of the result."

	(PRProject on: book) build: (PRHtmlOutput new
			 buildStrategy: PRBuildRootMainStrategy new;
			 yourself).
	^ book / '_result' / 'html'
]

{ #category : 'running' }
PRCustomSupportTest >> setUp [

	super setUp.
	book := FileSystem memory / 'book'.
	self
		writeFile: 'pillar.conf'
		contents: '{ "title" : "My Book", "htmlWriter" : #michtml }';
		writeFile: 'index.md' contents: 'Welcome.';
		writeFile: '_support/templates/html/main.mustache'
		contents: '[support]{{{content}}}';
		writeFile: '_support/html/css/book.css' contents: 'support book';
		writeFile: '_support/html/css/other.css' contents: 'support other'
]

{ #category : 'tests' }
PRCustomSupportTest >> testBookWithoutCustomUsesItsSupport [

	| result |
	result := self build.

	self
		assert: (result / '_support' / 'html' / 'css' / 'book.css') contents
		equals: 'support book'.
	self assert:
		((result / 'index.html') contents beginsWith: '[support]')
]

{ #category : 'tests - additions' }
PRCustomSupportTest >> testCustomCssIsAnnouncedToTheHtmlTemplate [

	self
		writeFile: '_support/templates/html/main.mustache'
		contents: '{{#customCss}}[custom css]{{/customCss}}{{{content}}}';
		writeFile: '_custom/html/css/custom.css' contents: 'my rules'.

	self assert:
		((self build / 'index.html') contents beginsWith: '[custom css]')
]

{ #category : 'tests - additions' }
PRCustomSupportTest >> testCustomCssIsAnnouncedToTheSiteTemplate [

	self
		writeFile: '_support/templates/html/site.mustache'
		contents: '{{#customCss}}[custom css]{{/customCss}}{{{content}}}';
		writeFile: '_custom/html/css/custom.css' contents: 'my rules'.
	(PRProject on: book) build: (PRHtmlBookOutput new
			 buildStrategy: PRBuildRootMainStrategy new;
			 yourself).

	self assert:
		((book / '_result' / 'site' / 'index.html') contents beginsWith:
			 '[custom css]')
]

{ #category : 'tests' }
PRCustomSupportTest >> testCustomFileReplacesTheSupportFile [

	self writeFile: '_custom/html/css/book.css' contents: 'custom book'.

	self
		assert:
		(self build / '_support' / 'html' / 'css' / 'book.css') contents
		equals: 'custom book'
]

{ #category : 'tests' }
PRCustomSupportTest >> testCustomFileWithoutSupportVersionIsAdded [

	self writeFile: '_custom/html/css/custom.css' contents: 'my rules'.

	self
		assert:
		(self build / '_support' / 'html' / 'css' / 'custom.css') contents
		equals: 'my rules'
]

{ #category : 'tests' }
PRCustomSupportTest >> testCustomFilesDoNotChangeTheSupportFolderOfTheBook [

	self writeFile: '_custom/html/css/book.css' contents: 'custom book'.
	self build.

	self
		assert: (book / '_support' / 'html' / 'css' / 'book.css') contents
		equals: 'support book'
]

{ #category : 'tests' }
PRCustomSupportTest >> testCustomFolderIsNotCopiedToTheOutput [

	self writeFile: '_custom/html/css/custom.css' contents: 'my rules'.

	self deny: (self build / '_custom') exists
]

{ #category : 'tests' }
PRCustomSupportTest >> testCustomReadmeIsNotCopied [

	self writeFile: '_custom/README.md' contents: 'How to customize'.

	self deny: (self build / '_support' / 'README.md') exists
]

{ #category : 'tests' }
PRCustomSupportTest >> testCustomSiteTemplateIsUsedBySite [

	self
		writeFile: '_custom/templates/html/site.mustache'
		contents: '[custom site]{{{content}}}'.
	(PRProject on: book) build: (PRHtmlBookOutput new
			 buildStrategy: PRBuildRootMainStrategy new;
			 yourself).

	self assert:
		((book / '_result' / 'site' / 'index.html') contents beginsWith:
			 '[custom site]')
]

{ #category : 'tests' }
PRCustomSupportTest >> testCustomTemplateIsUsed [

	self
		writeFile: '_custom/templates/html/main.mustache'
		contents: '[custom]{{{content}}}'.

	self assert:
		((self build / 'index.html') contents beginsWith: '[custom]')
]

{ #category : 'tests - additions' }
PRCustomSupportTest >> testNoCustomCssIsAnnouncedToTheHtmlTemplate [

	self
		writeFile: '_support/templates/html/main.mustache'
		contents: '{{#customCss}}[custom css]{{/customCss}}{{{content}}}'.

	self deny: ((self build / 'index.html') contents includesSubstring:
			 '[custom css]')
]

{ #category : 'tests' }
PRCustomSupportTest >> testSupportFilesWithoutCustomVersionAreKept [

	self writeFile: '_custom/html/css/book.css' contents: 'custom book'.

	self
		assert:
		(self build / '_support' / 'html' / 'css' / 'other.css') contents
		equals: 'support other'
]

{ #category : 'helpers' }
PRCustomSupportTest >> writeFile: aPath contents: aString [
	"Create or replace the file at aPath in the book folder, with its parent folders."

	| file |
	file := book resolve: aPath.
	file parent ensureCreateDirectory.
	file ensureDelete.
	file writeStreamDo: [ :stream | stream nextPutAll: aString ]
]
