"
I check that `PRHtmlBookOutput` builds a small book of two chapter files, in a memory file system, as a site: the index and one page per chapter named after its header, their titles, the previous and next links, and the references from one chapter to another.
"
Class {
	#name : 'PRHtmlBookOutputTest',
	#superclass : 'TestCase',
	#instVars : [
		'book'
	],
	#category : 'Pillar-Tests-Project',
	#package : 'Pillar-Tests-Project'
}

{ #category : 'helpers' }
PRHtmlBookOutputTest >> build [
	"Build the book as a site, from its index.md, and answer the folder of the site."

	| target |
	target := PRHtmlBookOutput new.
	target buildStrategy: PRBuildRootMainStrategy new.
	(PRProject on: book) build: target.
	^ book / '_result' / 'site'
]

{ #category : 'helpers' }
PRHtmlBookOutputTest >> pageNamed: aString [

	^ (self build / aString) contents
]

{ #category : 'running' }
PRHtmlBookOutputTest >> setUp [

	super setUp.
	book := FileSystem memory / 'book'.
	self
		writeFile: 'pillar.conf'
		contents: '{ "title" : "My Book", "htmlWriter" : #michtml }';
		writeFile: 'index.md' contents: 'Welcome.

<!inputFile|path=Chapters/one.md!>

<!inputFile|path=Chapters/two.md!>';
		writeFile: 'Chapters/one.md' contents: '## Microdown syntax

See *@two@*.

### Emphasis

Some text.';
		writeFile: 'Chapters/two.md' contents: '## Second chapter
@two

The end.';
		writeFile: '_support/templates/html/main.mustache'
		contents:
			'<title>{{title}}</title>[{{bookTitle}}]{{#previous}}[previous:{{href}}:{{title}}]{{/previous}}{{#next}}[next:{{href}}:{{title}}]{{/next}}{{{content}}}{{#toc}}{{#children}}[toc:{{href}}:{{name}}{{#isCurrent}}:current{{/isCurrent}}{{#children}}[section:{{href}}:{{name}}]{{/children}}]{{/children}}{{/toc}}'
]

{ #category : 'tests - pages' }
PRHtmlBookOutputTest >> testBuildWritesTheIndexAndOnePagePerChapter [

	| site |
	site := self build.

	self assert: (site / 'index.html') exists.
	self assert: (site / 'microdown-syntax.html') exists.
	self assert: (site / 'two.html') exists
]

{ #category : 'tests - pages' }
PRHtmlBookOutputTest >> testChapterNamedIndexDoesNotReplaceTheIndex [

	| site |
	self writeFile: 'Chapters/two.md' contents: '## Index

The end.'.

	site := self build.

	self assert:
		((site / 'index.html') contents includesSubstring: 'Welcome.').
	self assert:
		((site / 'index-2.html') contents includesSubstring: 'The end.')
]

{ #category : 'tests - pages' }
PRHtmlBookOutputTest >> testChapterPageHoldsItsChapterOnly [

	| page |
	page := self pageNamed: 'microdown-syntax.html'.

	self assert: (page includesSubstring: 'Microdown syntax</h2>').
	self deny: (page includesSubstring: 'The end.')
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testChapterPageTitleIsItsHeader [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '<title>Microdown syntax</title>[My Book]')
]

{ #category : 'tests - figures' }
PRHtmlBookOutputTest >> testFigureOfAChapterIsRelativeToTheSite [

	self writeFile: 'Chapters/one.md' contents: '## Microdown syntax

![A caption.](figures/x.png)'.

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 'src="Chapters/figures/x.png"')
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testIndexHasNoCurrentChapterInTheToc [

	self deny:
		((self pageNamed: 'index.html') includesSubstring: ':current')
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testIndexHasNoPreviousPage [

	| index |
	index := self pageNamed: 'index.html'.

	self deny: (index includesSubstring: '[previous:').
	self assert: (index includesSubstring:
			 '[next:microdown-syntax.html:Microdown syntax]')
]

{ #category : 'tests - pages' }
PRHtmlBookOutputTest >> testIndexHoldsWhatComesBeforeTheFirstChapter [

	| index |
	index := self pageNamed: 'index.html'.

	self assert: (index includesSubstring: 'Welcome.').
	self deny: (index includesSubstring: 'Microdown syntax</h2>')
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testIndexTitleIsTheBookTitle [

	self assert: ((self pageNamed: 'index.html') includesSubstring:
			 '<title>My Book</title>[My Book]')
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testLastPageHasNoNextPage [

	self deny: ((self pageNamed: 'two.html') includesSubstring: '[next:')
]

{ #category : 'tests - templates' }
PRHtmlBookOutputTest >> testMainTemplateIsUsedWhenTheBookHasNoSiteTemplate [

	self assert:
		((self pageNamed: 'index.html') beginsWith: '<title>My Book</title>')
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testPagesLinkToThePreviousAndNextPages [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '[previous:index.html:My Book][next:two.html:Second chapter]')
]

{ #category : 'tests - references' }
PRHtmlBookOutputTest >> testReferenceToAnotherChapterLinksToItsPage [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '<a href="two.html#two">two</a>')
]

{ #category : 'tests - templates' }
PRHtmlBookOutputTest >> testSiteTemplateIsUsedWhenTheBookHasOne [

	self
		writeFile: '_support/templates/html/site.mustache'
		contents: '[site]{{{content}}}'.

	self assert: ((self pageNamed: 'index.html') beginsWith: '[site]')
]

{ #category : 'tests - pages' }
PRHtmlBookOutputTest >> testSupportFilesAreCopiedToTheSite [

	self assert:
		(self build / '_support' / 'templates' / 'html' / 'main.mustache')
			exists
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocDoesNotListChaptersAsSectionsOfAHigherChapter [

	self writeIndexWithATitle.

	self assert: ((self pageNamed: 'my-book.html') includesSubstring:
			 '[toc:my-book.html:My Book:current][toc:microdown-syntax.html:Microdown syntax]')
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocListsChaptersNestedUnderAHigherChapter [

	self writeIndexWithATitle.

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '[toc:my-book.html:My Book][toc:microdown-syntax.html:Microdown syntax:current[section:#emphasis:Emphasis]][toc:two.html:Second chapter]')
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocListsTheChaptersWithTheirPages [

	self assert: ((self pageNamed: 'index.html') includesSubstring:
			 '[toc:microdown-syntax.html:Microdown syntax][toc:two.html:Second chapter]')
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocShowsNoSectionsOfTheOtherChapters [

	self assert: ((self pageNamed: 'two.html') includesSubstring:
			 '[toc:microdown-syntax.html:Microdown syntax][toc:two.html:Second chapter:current]')
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocShowsTheSectionsOfTheCurrentChapter [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '[toc:microdown-syntax.html:Microdown syntax:current[section:#emphasis:Emphasis]][toc:two.html:Second chapter]')
]

{ #category : 'helpers' }
PRHtmlBookOutputTest >> writeFile: aPath contents: aString [
	"Create the file at aPath in the book folder, with its parent folders."

	| file |
	file := book resolve: aPath.
	file parent ensureCreateDirectory.
	file writeStreamDo: [ :stream | stream nextPutAll: aString ]
]

{ #category : 'helpers' }
PRHtmlBookOutputTest >> writeIndexWithATitle [

	self writeFile: 'index.md' contents: '# My Book

Welcome.

<!inputFile|path=Chapters/one.md!>

<!inputFile|path=Chapters/two.md!>'
]
