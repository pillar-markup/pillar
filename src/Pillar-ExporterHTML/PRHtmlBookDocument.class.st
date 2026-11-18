"
I write a book as the pages of a web site: `index.html` with what comes before the first chapter, and one page per chapter, each page applied to the page template of the site: `site.mustache` when the book has one, otherwise the template of `pillar build html` (`main.mustache`, or the template of `pillar.conf`).

## Life cycle: who creates me and who uses me

1. `PRHtmlBookOutput>>documentFor:` creates me for a file to build, usually `index.md`, with its project and output folder.
2. `PRAbstractOutputDocument>>buildOn:` (inherited) parses the file, inlines its input files, reads its metadata, applies the transformations, then sends me `writeDocument:` with the whole book.
3. I run the Microdown passes on the book, write each page, and answer the index file.

## Responsibility:

- I run the passes in order: `MicPathRelativizer` (figures relative to the book folder), `MicHeaderIdentifier` (link targets of the headers), `MicNumberer` (numbers of chapters, sections, figures, listings and equations; on unless `pillar.conf` says `""numbering"" : false`, since numbers help readers find their way), `MicTocBuilder` (the table of contents of the whole book, built once), `MicChapterSplitter` (chapters at `##`), then `MicPageReferenceResolver` (references to another page).
- I name each chapter page after the target of its header (`microdown-syntax.html`, or `second.html` for a header with `@second`), never `index.html`, which belongs to the home page (a chapter Index gives `index-2.html`).
- I give the page template the values of the book (`pillar.conf` and the metadata of `index.md`) plus `content`, `title` (of the page), `bookTitle`, `toc`, and `previous` and `next` (each with `href` and `title`, absent on the first and last pages).

## Collaborators: 

- `MicPathRelativizer`, `MicHeaderIdentifier`, `MicNumberer`, `MicTocBuilder`, `MicChapterSplitter`, `MicPageReferenceResolver`: the passes.
- The writer of `htmlWriter`: writes the HTML of each page; `michtml` is `MicBookHTMLVisitor`, which shows the numbers (`micbasichtml`, `MicHTMLVisitor`, does not).
- `MustacheTemplate` and `ConfigurationForPillar`: the page template and its values.

## Public API and Key Messages

- `writeDocument: aBook` write the pages of aBook and answer the index file.
- `pagesOf: aBook` the pages, pairs page name -> document.

## Examples

```
PRHtmlBookDocument exampleOfASmallBook
```

## Internal Representation

- `tocBuilder`: the `MicTocBuilder` of the whole book, which also turns entries into template values.
- `chapterEntries`: the entry of each chapter in its table of contents, in page order, found by the header that starts the chapter.

### Implementation Points

- All the pages are at the top of the site folder, next to the copied chapter folders.
- The pages are at the top of the site, which mirrors the book folder, so a figure relative to the book folder (`Chapters/Chapter1/figures/x.png`) is right for every page.
- `toc` has the shape of `MicTocBuilder>>templateValues` (`children`, each with `name`, `number`, `href`, `hasChildren`, `children`) plus `isCurrent`: one entry per chapter linking to its page; only the current chapter lists its sections: the children of its entry in the table of contents of the book, without the chapters nested in it (a `#` title above `##` chapters), so page templates written for the table of contents of one document work unchanged.
"
Class {
	#name : 'PRHtmlBookDocument',
	#superclass : 'PRHtmlDocument',
	#instVars : [
		'tocBuilder',
		'chapterEntries'
	],
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'examples' }
PRHtmlBookDocument class >> exampleOfASmallBook [
	"The document that writes the pages of a small book (see PRHtmlBookOutput class>>#smallBook) from its index.md."

	<sampleInstance>
	| project |
	project := PRProject on: PRHtmlBookOutput smallBook.
	^ PRHtmlBookOutput exampleFromIndex documentFor:
		  ((PRInputDocument forFile: project baseDirectory / 'index.md')
			   project: project;
			   yourself)
]

{ #category : 'pages' }
PRHtmlBookDocument >> entriesOf: aCollectionOfChapters in: aCollectionOfTocEntries [
	"Answer, in book order, the entries of the table of contents (and of their children) whose header starts one of aCollectionOfChapters. They are found by their header, the same object in the book and in its chapter; a chapter may be nested in the entry of a higher one (a # title above ## chapters)."

	| chapterHeaders |
	chapterHeaders := (aCollectionOfChapters collect: [ :each |
		                   each children first ]) asIdentitySet.
	^ self entriesWithHeaders: chapterHeaders in: aCollectionOfTocEntries
]

{ #category : 'pages' }
PRHtmlBookDocument >> entriesWithHeaders: aSet in: aCollectionOfTocEntries [
	"Walk the entries and their children in book order, and answer those whose header is in aSet."

	^ aCollectionOfTocEntries flatCollect: [ :each |
			  ((aSet includes: each header)
				   ifTrue: [ { each } ]
				   ifFalse: [ #(  ) ])
			  , (self entriesWithHeaders: aSet in: each children) ]
]

{ #category : 'testing' }
PRHtmlBookDocument >> isNumbered [
	"Sites show the numbers of chapters, sections, figures, listings and equations, which helps readers find their way; a book turns them off with numbering false in pillar.conf."

	^ self configuration propertyAt: #numbering ifAbsent: [ true ]
]

{ #category : 'template values' }
PRHtmlBookDocument >> linkToPageAt: anIndex in: aCollectionOfPages [
	"Answer the values of a link to the page at anIndex, as the page template uses them for previous and next: href (the file name of the page) and title (its title)."

	^ Dictionary new
		  at: 'href' put: (aCollectionOfPages at: anIndex) key;
		  at: 'title'
		  put: (self titleOfPageAt: anIndex in: aCollectionOfPages);
		  yourself
]

{ #category : 'pages' }
PRHtmlBookDocument >> pageNameOf: aChapter in: aSet [
	"Answer the file name of the page of aChapter: the target of its header, made unique among the names of aSet (e.g. a chapter Index gives index-2.html, not index.html)."

	| name |
	name := MicHeaderIdentifier new
		        uniqueId:
		        (MicHeaderIdentifier targetOf: aChapter children first)
		        in: aSet.
	^ name , '.html'
]

{ #category : 'pages' }
PRHtmlBookDocument >> pagesOf: aBook [
	"Run the Microdown passes on aBook and answer its pages, as pairs page name -> document: index.html with what comes before the first chapter, then one page per chapter, named after the target of its header (see MicHeaderIdentifier). The passes: make the figure paths relative to the book folder (the pages are written at the top of the site, which mirrors it), identify the headers, number the book (unless numbering is false in pillar.conf), build the table of contents of the whole book, split it into chapters, resolve the references across pages."

	| splitter pages names |
	MicPathRelativizer new
		relativize: aBook
		to: self project baseDirectory.
	MicHeaderIdentifier new identify: aBook.
	splitter := MicChapterSplitter new.
	self isNumbered ifTrue: [
			MicNumberer new
				chapterLevel: splitter chapterLevel;
				number: aBook ].
	tocBuilder := MicTocBuilder new.
	tocBuilder limitUpTo: splitter chapterLevel + 1.
	tocBuilder visit: aBook.
	splitter split: aBook.
	chapterEntries := self
		                  entriesOf: splitter chapters
		                  in: tocBuilder tocItems.
	names := Set with: 'index'.
	pages := OrderedCollection with: 'index.html' -> splitter frontMatter.
	pages addAll: (splitter chapters collect: [ :each |
			 (self pageNameOf: each in: names) -> each ]).
	MicPageReferenceResolver new resolve: pages.
	^ pages
]

{ #category : 'template values' }
PRHtmlBookDocument >> sectionsOfChapterAt: anIndex [
	"Answer the template values of the sections of the chapter at anIndex: the children of its entry in the table of contents of the book, without the chapters nested in it, which have their own pages."

	^ ((chapterEntries at: anIndex) children reject: [ :each |
		   chapterEntries includes: each ])
		  collect: [ :each | tocBuilder templateValuesOf: each ]
		  as: Array
]

{ #category : 'templating' }
PRHtmlBookDocument >> siteTemplateName [

	^ 'site.mustache'
]

{ #category : 'templating' }
PRHtmlBookDocument >> templateFile: aDocument [
	"Answer the page template of the site: site.mustache when the book has one, so that the book keeps main.mustache for pillar build html; otherwise the template pillar build html uses."

	| siteTemplate |
	siteTemplate := self templateDirectory / self siteTemplateName.
	^ siteTemplate exists
		  ifTrue: [ siteTemplate ]
		  ifFalse: [ super templateFile: aDocument ]
]

{ #category : 'pages' }
PRHtmlBookDocument >> titleOfPageAt: anIndex in: aCollectionOfPages [
	"The title of the index is the title of the book; the title of a chapter is the text of its header."

	anIndex = 1 ifTrue: [
		^ self configuration propertyAt: #title ifAbsent: [ 'Index' ] ].
	^ (aCollectionOfPages at: anIndex) value children first text
]

{ #category : 'template values' }
PRHtmlBookDocument >> tocEntryOfPageAt: anIndex in: aCollectionOfPages current: aBoolean [
	"Answer the table of contents entry of the chapter page at anIndex: name, number (nil when not numbered), href (the page), isCurrent, and as children its sections when it is the current chapter."

	| sections |
	sections := aBoolean
		            ifTrue: [ self sectionsOfChapterAt: anIndex - 1 ]
		            ifFalse: [ #(  ) ].
	^ Dictionary new
		  at: 'name'
		  put: (self titleOfPageAt: anIndex in: aCollectionOfPages);
		  at: 'number' put: (MicNumberer numberStringOf:
					   (aCollectionOfPages at: anIndex) value children first);
		  at: 'href' put: (aCollectionOfPages at: anIndex) key;
		  at: 'isCurrent' put: aBoolean;
		  at: 'hasChildren' put: sections isNotEmpty;
		  at: 'children' put: sections;
		  yourself
]

{ #category : 'template values' }
PRHtmlBookDocument >> tocOfPageAt: anIndex in: aCollectionOfPages [
	"Answer the table of contents shown on the page at anIndex, in the shape of MicTocBuilder>>#templateValues: children holds one entry per chapter, linking to its page. The entry of the chapter of the page is marked isCurrent and is the only one showing its sections; the index page has no current chapter."

	^ Dictionary new
		  at: 'children' put: ((2 to: aCollectionOfPages size)
				   collect: [ :each |
						   self
							   tocEntryOfPageAt: each
							   in: aCollectionOfPages
							   current: each = anIndex ]
				   as: Array);
		  yourself
]

{ #category : 'template values' }
PRHtmlBookDocument >> valuesOfPageAt: anIndex in: aCollectionOfPages book: aBook [
	"Answer the values the page template gets for the page at anIndex: the values of the book (pillar.conf and the metadata of index.md), with content (the HTML of the page), title (of the page), bookTitle, toc (see tocOfPageAt:in:), and previous and next (href and title), absent on the first and last pages."

	| values |
	values := ConfigurationForPillar newFromDictionary: Dictionary new.
	values parent: aBook properties.
	values
		at: #content
		put: (self writer write: (aCollectionOfPages at: anIndex) value).
	values
		at: #title
		put: (self titleOfPageAt: anIndex in: aCollectionOfPages).
	values
		at: #bookTitle
		put: (self titleOfPageAt: 1 in: aCollectionOfPages).
	values
		at: #toc
		put: (self tocOfPageAt: anIndex in: aCollectionOfPages).
	anIndex > 1 ifTrue: [
			values
				at: #previous
				put: (self linkToPageAt: anIndex - 1 in: aCollectionOfPages) ].
	anIndex < aCollectionOfPages size ifTrue: [
			values
				at: #next
				put: (self linkToPageAt: anIndex + 1 in: aCollectionOfPages) ].
	^ values
]

{ #category : 'writing' }
PRHtmlBookDocument >> write: aString to: aFile [
	"Write aString as the whole contents of aFile, replacing the file of a previous build and creating its folder when needed."

	aFile ensureDelete.
	aFile parent ensureCreateDirectory.
	aFile writeStreamDo: [ :stream | stream nextPutAll: aString ]
]

{ #category : 'building' }
PRHtmlBookDocument >> writeDocument: aDocument [
	"Write the book as the pages of a site and answer the index file; I replace the superclass version, which writes a single file.
	PRAbstractOutputDocument>>#buildOn: sends me aDocument once it is the whole book: index.md parsed, its chapters inlined, its metadata read and the transformations applied. I cut it into pages (see pagesOf:), write each page through the page template of the book, with its own values (see valuesOfPageAt:in:book:), into my output directory (_result/site), and answer index.html, which buildOn: gives to postWriteTransform:."

	| pages template |
	pages := self pagesOf: aDocument.
	template := MustacheTemplate on:
		            (self templateFile: aDocument) readStream contents.
	pages doWithIndex: [ :page :index |
			self
				write: (template value:
						 (self valuesOfPageAt: index in: pages book: aDocument))
				to: self outputDirectory / page key ].
	^ self outputDirectory / pages first key
]
