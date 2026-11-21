"
I am the output of a book as a web site: `pillar build site`. Where `PRHtmlOutput` writes one HTML file per input file, I write a home page and one page per chapter, linked together.

## Life cycle: who creates me and who uses me

1. `ClapPillarBuildCommand>>outputTarget` creates me when the format is `site` (my `builderName`); a script can also create me with `new` and a build strategy (see `exampleFromIndex`).
2. `PRProject>>build:` prepares me (`prepareForExecutionOn:`, inherited: it clears `_result`, copies `_support` and the folders of the book into `_result/site`) and then builds each file of my strategy, usually `index.md`.
3. For each file, `documentFor:` answers a `PRHtmlBookDocument`, which writes the pages into `_result/site`.

## Responsibility:

- I name the format `site` and the output folder `site`.
- I give each built file a `PRHtmlBookDocument`.
- Everything else (copying the support files, the transformations, the writer from `htmlWriter` in `pillar.conf`) comes from `PRHtmlOutput`.

## Collaborators: 

- `PRHtmlBookDocument`: writes the pages.
- `PRProject`: builds me.
- `ClapPillarBuildCommand`: finds me by my `builderName`.

## Public API and Key Messages

- `PRHtmlBookOutput builderName` answers `site`.
- `documentFor: aFile` answers the `PRHtmlBookDocument` of aFile.

## Examples

```
PRHtmlBookOutput exampleFromIndex.
PRHtmlBookOutput scriptBuildASmallBook
```
"
Class {
	#name : 'PRHtmlBookOutput',
	#superclass : 'PRHtmlOutput',
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'accessing' }
PRHtmlBookOutput class >> builderName [
	"The format of the command line: pillar build site."

	^ 'site'
]

{ #category : 'examples' }
PRHtmlBookOutput class >> exampleFromIndex [
	"An output that builds a book from its index.md, as pillar build site does by default."

	<sampleInstance>
	^ self new
		  buildStrategy: PRBuildRootMainStrategy new;
		  yourself
]

{ #category : 'script' }
PRHtmlBookOutput class >> scriptBuildASmallBook [
	"Build a small book of two chapters as a site and answer its pages: index.html, first-chapter.html and second-chapter.html (each chapter page is named after the title of the chapter). The first chapter links to the second one, which has the anchor @second, with second-chapter.html#second."

	<example>
	| book site |
	book := self smallBook.
	(PRProject on: book) build: self exampleFromIndex.
	site := book / '_result' / 'site'.
	^ site files
		  select: [ :each | each extension = 'html' ]
		  thenCollect: [ :each | each basename -> each contents ]
]

{ #category : 'private - demo' }
PRHtmlBookOutput class >> smallBook [
	"Answer the folder of a small book in a memory file system: an index with a welcome text and two chapter files, a configuration and a page template."

	| book |
	book := FileSystem memory / 'book'.
	{
		('pillar.conf'
		 -> '{ "title" : "A small book", "htmlWriter" : #michtml }').
		('index.md' -> 'Welcome.

<!inputFile|path=Chapters/one.md!>

<!inputFile|path=Chapters/two.md!>').
		('Chapters/one.md' -> '## First chapter

As said in *@second@*.').
		('Chapters/two.md' -> '## Second chapter
@second

The end.').
		('_support/templates/html/main.mustache'
		 ->
		 '<title>{{title}}</title>{{{content}}}{{#next}}<a href="{{href}}">{{title}}</a>{{/next}}') }
		do: [ :each |
				| file |
				file := book resolve: each key.
				file parent ensureCreateDirectory.
				file writeStreamDo: [ :stream | stream nextPutAll: each value ] ].
	^ book
]

{ #category : 'preparation' }
PRHtmlBookOutput >> copyBookOf: aPRProject to: anOutputDirectory [
	"Copy nothing: a site does not need the sources, logs or configuration of the book. PRHtmlBookDocument>>copyFilesOf:book: copies the files the pages show (figures and cover) once the passes have run."

	
]

{ #category : 'building' }
PRHtmlBookOutput >> documentFor: aFile [
	"Answer the document that builds aFile (usually index.md) as the pages of a site, written into the site folder of the project."

	^ PRHtmlBookDocument new
		  project: aFile project;
		  file: aFile;
		  target: self;
		  outputDirectory:
			  aFile project outputDirectory / self outputDirectoryName;
		  yourself
]

{ #category : 'accessing' }
PRHtmlBookOutput >> outputDirectoryName [
	"The folder of the site in the output folder of the project: _result/site. The inherited prepareForExecutionOn: copies _support and the folders of the book there."

	^ 'site'
]

{ #category : 'accessing' }
PRHtmlBookOutput >> writerFor: aPRPillarConfiguration [
	"The site is always written by the book writer (michtml): its pages need the numbers of the headers, figures and listings and the links across pages that only this writer produces. The htmlWriter of pillar.conf is for pillar build html, so a missing, unknown or plain writer there does not break the site."

	^ MicBookHTMLVisitor new
]
