"
I write a book as the pages of a web site: `index.html` with what comes before the first chapter, and one page per chapter, each page applied to the page template of the book (`main.mustache`, or the template of `pillar.conf`).

## Life cycle: who creates me and who uses me

1. `PRHtmlBookOutput>>documentFor:` creates me for a file to build, usually `index.md`, with its project and output folder.
2. `PRAbstractOutputDocument>>buildOn:` (inherited) parses the file, inlines its input files, reads its metadata, applies the transformations, then sends me `writeDocument:` with the whole book.
3. I run the Microdown passes on the book, write each page, and answer the index file.

## Responsibility:

- I run the passes in order: `MicHeaderIdentifier` (link targets of the headers), `MicChapterSplitter` (chapters at `##`), then `MicPageReferenceResolver` (references to another page).
- I name each chapter page after the target of its header (`microdown-syntax.html`, or `second.html` for a header with `@second`), never `index.html`, which belongs to the home page (a chapter Index gives `index-2.html`).
- I give the page template the values of the book (`pillar.conf` and the metadata of `index.md`) plus `content`, `title` (of the page), `bookTitle`, and `previous` and `next` (each with `href` and `title`, absent on the first and last pages).

## Collaborators: 

- `MicHeaderIdentifier`, `MicChapterSplitter`, `MicPageReferenceResolver`: the passes.
- The writer of `htmlWriter` (e.g. `MicHTMLVisitor`): writes the HTML of each page.
- `MustacheTemplate` and `ConfigurationForPillar`: the page template and its values.

## Public API and Key Messages

- `writeDocument: aBook` write the pages of aBook and answer the index file.
- `pagesOf: aBook` the pages, pairs page name -> document.

## Examples

```
PRHtmlBookDocument exampleOfASmallBook
```

### Implementation Points

- All the pages are at the top of the site folder, next to the copied chapter folders.
- Figures still refer to their files with absolute paths on the disk where the book was built: a later pass will make them relative to the site.
- No table of contents yet (`toc`): next step.
"
Class {
	#name : 'PRHtmlBookDocument',
	#superclass : 'PRHtmlDocument',
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
	"Run the Microdown passes on aBook and answer its pages, as pairs page name -> document: index.html with what comes before the first chapter, then one page per chapter, named after the target of its header (see MicHeaderIdentifier)."

	| splitter pages names |
	MicHeaderIdentifier new identify: aBook.
	splitter := MicChapterSplitter new.
	splitter split: aBook.
	names := Set with: 'index'.
	pages := OrderedCollection with: 'index.html' -> splitter frontMatter.
	pages addAll: (splitter chapters collect: [ :each |
			 (self pageNameOf: each in: names) -> each ]).
	MicPageReferenceResolver new resolve: pages.
	^ pages
]

{ #category : 'pages' }
PRHtmlBookDocument >> titleOfPageAt: anIndex in: aCollectionOfPages [
	"The title of the index is the title of the book; the title of a chapter is the text of its header."

	anIndex = 1 ifTrue: [
		^ self configuration propertyAt: #title ifAbsent: [ 'Index' ] ].
	^ (aCollectionOfPages at: anIndex) value children first text
]

{ #category : 'template values' }
PRHtmlBookDocument >> valuesOfPageAt: anIndex in: aCollectionOfPages book: aBook [
	"Answer the values the page template gets for the page at anIndex: the values of the book (pillar.conf and the metadata of index.md), with content (the HTML of the page), title (of the page), bookTitle, and previous and next (href and title), absent on the first and last pages."

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
