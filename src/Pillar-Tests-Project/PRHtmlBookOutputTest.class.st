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

{ #category : 'helpers' }
PRHtmlBookOutputTest >> parsedIndex [
	"Answer index.md of the book as the site output parses it before transforming and writing it."

	^ self parsedIndexFor: PRHtmlBookDocument new
]

{ #category : 'helpers' }
PRHtmlBookOutputTest >> parsedIndexFor: anOutputDocument [
	"Answer index.md of the book as anOutputDocument parses it before transforming and writing it."

	| project |
	project := PRProject on: book.
	anOutputDocument project: project.
	^ anOutputDocument parsedDocumentOf:
		  ((PRInputDocument forFile: book / 'index.md')
			   project: project;
			   yourself)
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
	self assert: (site / 'second-chapter.html') exists
]

{ #category : 'tests - output folder' }
PRHtmlBookOutputTest >> testBuildingTheSiteKeepsThePdf [

	| pdf |
	pdf := book / '_result' / 'pdf' / 'index.pdf'.
	pdf ensureCreateFile.

	self build.

	self assert: pdf exists
]

{ #category : 'tests - output folder' }
PRHtmlBookOutputTest >> testBuildingTheSiteRemovesItsOldPages [

	| old |
	old := book / '_result' / 'site' / 'old.html'.
	old ensureCreateFile.

	self build.

	self deny: old exists
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

{ #category : 'tests - numbers' }
PRHtmlBookOutputTest >> testChapterPageShowsTheNumbersOfItsHeaders [

	| page |
	page := self pageNamed: 'microdown-syntax.html'.

	self assert: (page includesSubstring:
			 '<h2 id="microdown-syntax"><span class="number">1</span> Microdown syntax</h2>').
	self assert: (page includesSubstring:
			 '<h3 id="emphasis"><span class="number">1.1</span> Emphasis</h3>')
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testChapterPageTitleIsItsHeader [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '<title>Microdown syntax</title>[My Book]')
]

{ #category : 'tests - book structure' }
PRHtmlBookOutputTest >> testChaptersAtLevelOneMakeThePages [

	| site |
	self
		writeFile: 'pillar.conf'
		contents:
		'{ "title" : "My Book", "htmlWriter" : #michtml, "chapterLevel" : 1, "paragraphLevel" : 4 }'.
	self writeFile: 'index.md' contents: 'Welcome.

# One

## A section

#### Important

Text.

# Two

The end.'.

	site := self build.

	self assert: ((site / 'one.html') contents includesSubstring:
			 '<span class="number">1.1</span> A section').
	self assert: ((site / 'one.html') contents includesSubstring:
			 '<h4 class="paragraph" id="important">Important</h4>').
	self assert: ((site / 'two.html') contents includesSubstring:
			 '<span class="number">2</span> Two')
]

{ #category : 'tests - book structure' }
PRHtmlBookOutputTest >> testDeclaredParagraphLevelAppliesToThePdfToo [

	self
		writeFile: 'pillar.conf'
		contents:
		'{ "title" : "My Book", "htmlWriter" : #michtml, "paragraphLevel" : 5 }'.

	self
		assert:
		(self parsedIndexFor: PRPDFDocument new) bookStructure
			paragraphLevel
		equals: 5
]

{ #category : 'tests - example' }
PRHtmlBookOutputTest >> testExampleOfASmallBookWritesItsPages [

	| document |
	document := PRHtmlBookDocument exampleOfASmallBook.

	PRHtmlBookOutput exampleFromIndex prepareForExecutionOn:
		document project.
	document buildOn: document project.

	self
		assert: (document outputDirectory children
				 select: [ :each | each extension = 'html' ]
				 thenCollect: [ :each | each basename ]) asSet
		equals:
		#( 'index.html' 'first-chapter.html' 'second-chapter.html' ) asSet.
	self assert:
		((document outputDirectory / 'first-chapter.html') contents
			 includesSubstring: 'href="second-chapter.html#second"')
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

{ #category : 'tests - book structure errors' }
PRHtmlBookOutputTest >> testInvalidStructureStopsTheBuild [

	self
		writeFile: 'pillar.conf'
		contents:
		'{ "title" : "My Book", "htmlWriter" : #michtml, "chapterLevel" : 1, "paragraphLevel" : 6 }'.

	self should: [ self build ] raise: MicInvalidBookStructure
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testLastPageHasNoNextPage [

	self deny:
		((self pageNamed: 'second-chapter.html') includesSubstring: '[next:')
]

{ #category : 'tests - numbers' }
PRHtmlBookOutputTest >> testListingShowsItsNumberAndCaption [

	self writeFile: 'Chapters/one.md' contents: '## Microdown syntax

```caption=A first listing
1 + 2
```'.

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '<figcaption><span class="number">Listing 1.1</span> A first listing</figcaption>')
]

{ #category : 'tests - templates' }
PRHtmlBookOutputTest >> testMainTemplateIsUsedWhenTheBookHasNoSiteTemplate [

	self assert:
		((self pageNamed: 'index.html') beginsWith: '<title>My Book</title>')
]

{ #category : 'tests - writers' }
PRHtmlBookOutputTest >> testMicbasichtmlIsThePlainHTMLWriter [

	self
		writeFile: 'pillar.conf'
		contents: '{ "title" : "My Book", "htmlWriter" : #micbasichtml }'.

	self assert: self writerOfIndex class equals: MicHTMLVisitor
]

{ #category : 'tests - writers' }
PRHtmlBookOutputTest >> testMichtmlIsTheBookWriter [

	self assert: self writerOfIndex class equals: MicBookHTMLVisitor
]

{ #category : 'tests - numbers' }
PRHtmlBookOutputTest >> testNumberingFalseShowsNoNumbers [

	| page |
	self
		writeFile: 'pillar.conf'
		contents:
		'{ "title" : "My Book", "htmlWriter" : #michtml, "numbering" : false }'.

	page := self pageNamed: 'microdown-syntax.html'.

	self deny: (page includesSubstring: 'class="number"').
	self assert:
		(page includesSubstring: '<a href="second-chapter.html#two">two</a>')
]

{ #category : 'tests - page names' }
PRHtmlBookOutputTest >> testPageNameIgnoresTheSpacesAroundTheTitle [

	self
		assert: (PRHtmlBookDocument new pageNameForTitle: '  Collections  ')
		equals: 'collections'
]

{ #category : 'tests - page names' }
PRHtmlBookOutputTest >> testPageNameIsTheTitleInLowercaseWithDashes [

	self
		assert: (PRHtmlBookDocument new pageNameForTitle: 'Basic Classes')
		equals: 'basic-classes'
]

{ #category : 'tests - page names' }
PRHtmlBookOutputTest >> testPageNameJoinsTheWordsWithASingleDash [

	self
		assert: (PRHtmlBookDocument new pageNameForTitle:
				 'SUnit:  Tests   in `Pharo`.')
		equals: 'sunit-tests-in-pharo'
]

{ #category : 'tests - page names' }
PRHtmlBookOutputTest >> testPageNameKeepsAWordLongerThanTwentyCharacters [

	self
		assert: (PRHtmlBookDocument new pageNameForTitle:
				 'Supercalifragilisticexpialidocious word')
		equals: 'supercalifragilisticexpialidocious'
]

{ #category : 'tests - page names' }
PRHtmlBookOutputTest >> testPageNameOfATitleWithoutWordsIsChapter [

	self
		assert: (PRHtmlBookDocument new pageNameForTitle: ' : ')
		equals: 'chapter'
]

{ #category : 'tests - page names' }
PRHtmlBookOutputTest >> testPageNameStopsAfterTheWordReachingTwentyCharacters [

	self
		assert: (PRHtmlBookDocument new pageNameForTitle:
				 'Publishing and packaging your first Pharo project')
		equals: 'publishing-and-packaging'
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testPagesGetTheGenerationDate [

	self
		writeFile: '_support/templates/html/main.mustache'
		contents: '[date:{{generationDate}}]'.

	self
		assert: (self pageNamed: 'second-chapter.html')
		equals: ('[date:{1}]' format: { Date today yyyymmdd })
]

{ #category : 'tests - template values' }
PRHtmlBookOutputTest >> testPagesLinkToThePreviousAndNextPages [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '[previous:index.html:My Book][next:second-chapter.html:Second chapter]')
]

{ #category : 'tests - book structure' }
PRHtmlBookOutputTest >> testParagraphLevelFollowsTheChapterLevelWhenNotGiven [

	self
		writeFile: 'pillar.conf'
		contents:
		'{ "title" : "My Book", "htmlWriter" : #michtml, "chapterLevel" : 1 }'.

	self assert: self parsedIndex bookStructure paragraphLevel equals: 4
]

{ #category : 'tests - book structure' }
PRHtmlBookOutputTest >> testParsedBookHasTheStructureOfPillarConf [

	| structure |
	self
		writeFile: 'pillar.conf'
		contents:
		'{ "title" : "My Book", "htmlWriter" : #michtml, "chapterLevel" : 1, "paragraphLevel" : 3 }'.

	structure := self parsedIndex bookStructure.

	self assert: structure chapterLevel equals: 1.
	self assert: structure paragraphLevel equals: 3
]

{ #category : 'tests - book structure' }
PRHtmlBookOutputTest >> testParsedBookWithoutSettingsHasTheDefaultStructure [

	| structure |
	structure := self parsedIndex bookStructure.

	self assert: structure chapterLevel equals: 2.
	self assert: structure paragraphLevel equals: 5
]

{ #category : 'tests - numbers' }
PRHtmlBookOutputTest >> testPartDoesNotShiftTheChapterNumbers [

	self writeFile: 'index.md' contents: '## First chapter

Text.

# A part

## Second chapter

The end.'.

	self assert:
		((self pageNamed: 'second-chapter.html') includesSubstring:
			 '<span class="number">2</span> Second chapter')
]

{ #category : 'tests - book structure' }
PRHtmlBookOutputTest >> testPdfKeepsFifthLevelAsASubsubsectionByDefault [

	self
		assert:
		(self parsedIndexFor: PRPDFDocument new) bookStructure
			paragraphLevel
		equals: 6
]

{ #category : 'tests - book structure' }
PRHtmlBookOutputTest >> testPdfParagraphLevelFollowsTheChapterLevelWhenNotGiven [

	self
		writeFile: 'pillar.conf'
		contents:
		'{ "title" : "My Book", "htmlWriter" : #michtml, "chapterLevel" : 1 }'.

	self
		assert:
		(self parsedIndexFor: PRPDFDocument new) bookStructure
			paragraphLevel
		equals: 5
]

{ #category : 'tests - output folder' }
PRHtmlBookOutputTest >> testPreparingThePdfKeepsTheSite [
	"The PDF build runs latexmk; its first step, shared by all targets, is enough to check that it leaves the site alone."

	| site |
	site := book / '_result' / 'site' / 'index.html'.
	site ensureCreateFile.

	PRPdfOutput new prepareForExecutionOn: (PRProject on: book).

	self assert: site exists
]

{ #category : 'tests - pages' }
PRHtmlBookOutputTest >> testReferenceToAnAnchorWithAColonLinksToItsPage [

	self writeFile: 'Chapters/one.md' contents: '## Microdown syntax

See *@cha:two@*.'.
	self writeFile: 'Chapters/two.md' contents: '## Second chapter
@cha:two

The end.'.

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '<a href="second-chapter.html#cha:two">2</a>')
]

{ #category : 'tests - references' }
PRHtmlBookOutputTest >> testReferenceToAnotherChapterLinksToItsPage [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '<a href="second-chapter.html#two">2</a>')
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

{ #category : 'tests - pages' }
PRHtmlBookOutputTest >> testTitleWithAColonGivesAPageNameWithoutColon [

	| site |
	self
		writeFile: 'Chapters/two.md'
		contents: '## Traits: reusable class fragments
@two

The end.'.

	site := self build.

	self assert:
		((site / 'traits-reusable-class.html') contents includesSubstring:
			 'The end.').
	self deny:
		(site files anySatisfy: [ :each | each basename includes: $: ])
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
			 '[toc:my-book.html:My Book][toc:microdown-syntax.html:Microdown syntax:current[section:#emphasis:Emphasis]][toc:second-chapter.html:Second chapter]')
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocListsTheChaptersWithTheirPages [

	self assert: ((self pageNamed: 'index.html') includesSubstring:
			 '[toc:microdown-syntax.html:Microdown syntax][toc:second-chapter.html:Second chapter]')
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocMarksTheParts [

	self writeFile: 'index.md' contents: '## First chapter

Text.

# A part

## Second chapter

The end.'.
	self
		writeFile: '_support/templates/html/site.mustache'
		contents:
		'{{#toc}}{{#children}}[{{#isPart}}part:{{/isPart}}{{name}}]{{/children}}{{/toc}}'.

	self
		assert: (self pageNamed: 'first-chapter.html')
		equals: '[First chapter][part:A part][Second chapter]'
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocShowsNoSectionsOfTheOtherChapters [

	self assert:
		((self pageNamed: 'second-chapter.html') includesSubstring:
			 '[toc:microdown-syntax.html:Microdown syntax][toc:second-chapter.html:Second chapter:current]')
]

{ #category : 'tests - numbers' }
PRHtmlBookOutputTest >> testTocShowsTheNumbers [

	self
		writeFile: '_support/templates/html/site.mustache'
		contents:
		'{{#toc}}{{#children}}[{{#number}}{{.}} {{/number}}{{name}}{{#children}}({{#number}}{{.}} {{/number}}{{name}}){{/children}}]{{/children}}{{/toc}}'.

	self
		assert: (self pageNamed: 'microdown-syntax.html')
		equals: '[1 Microdown syntax(1.1 Emphasis)][2 Second chapter]'
]

{ #category : 'tests - toc' }
PRHtmlBookOutputTest >> testTocShowsTheSectionsOfTheCurrentChapter [

	self assert:
		((self pageNamed: 'microdown-syntax.html') includesSubstring:
			 '[toc:microdown-syntax.html:Microdown syntax:current[section:#emphasis:Emphasis]][toc:second-chapter.html:Second chapter]')
]

{ #category : 'helpers' }
PRHtmlBookOutputTest >> writeFile: aPath contents: aString [
	"Create or replace the file at aPath in the book folder, with its parent folders."

	| file |
	file := book resolve: aPath.
	file parent ensureCreateDirectory.
	file ensureDelete.
	file writeStreamDo: [ :stream | stream nextPutAll: aString ]
]

{ #category : 'helpers' }
PRHtmlBookOutputTest >> writeIndexWithATitle [

	self writeFile: 'index.md' contents: '# My Book

Welcome.

<!inputFile|path=Chapters/one.md!>

<!inputFile|path=Chapters/two.md!>'
]

{ #category : 'tests - writers' }
PRHtmlBookOutputTest >> writerOfIndex [
	"The HTML writer the document of index.md gets from the configuration of the book."

	^ (PRHtmlBookOutput exampleFromIndex documentFor:
		   ((PRInputDocument forFile: book / 'index.md')
			    project: (PRProject on: book);
			    yourself)) writer
]
