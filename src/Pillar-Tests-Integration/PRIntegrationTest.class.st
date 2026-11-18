"
I build the archetypes of the Pillar repository (found by `PRArchetype class>>archetypesDirectory`) with the real files of their sample books and support folders, as `pillar build html`, `pillar build site` and `pillar build pdf Lecture1.md` do, and check a part of the generated files.

Each test builds into its own folder, removed in `tearDown`, inside the temporary folder of the system, or the folder of the image when the first cannot be written (`buildRootDirectory`). The Beamer tests of the moocs compare the second slide of the generated LaTeX file, and are skipped on a machine without `latexmk`. The book PDF test compares parts of the generated LaTeX file only, never the PDF, and ignores a failure of `latexmk` itself (`isRaisedByLatexmk:`), so that it runs on a machine without LaTeX or its fonts.
"
Class {
	#name : 'PRIntegrationTest',
	#superclass : 'TestCase',
	#instVars : [
		'projectDirectory',
		'project'
	],
	#category : 'Pillar-Tests-Integration',
	#package : 'Pillar-Tests-Integration'
}

{ #category : 'helpers' }
PRIntegrationTest >> build: archetypeName with: anOutput strategy: aStrategy [
	"Install the archetype in the test project, build it as anOutput and answer the folder of the result."

	project installArchetypeNamed: archetypeName.
	project build: (anOutput
			 buildStrategy: aStrategy;
			 yourself).
	^ project outputDirectory / anOutput outputDirectoryName
]

{ #category : 'helpers' }
PRIntegrationTest >> buildHtml: archetypeName [
	"Build the archetype as pillar build html does."

	^ self
		  build: archetypeName
		  with: PRHtmlOutput new
		  strategy: PRBuildRootMainStrategy new
]

{ #category : 'helpers' }
PRIntegrationTest >> buildLaTeX: archetypeName [
	"Build the archetype as pillar build pdf does and answer the folder of the result. The LaTeX file is what we check: a failure of latexmk (not installed, missing font) is ignored, any other error is not."

	^ [
		  self
			  build: archetypeName
			  with: PRPdfOutput new
			  strategy: PRBuildRootMainStrategy new ]
		  on: Error
		  do: [ :error |
				  (self isRaisedByLatexmk: error) ifFalse: [ error pass ].
				  project outputDirectory / PRPdfOutput new outputDirectoryName ]
]

{ #category : 'helpers' }
PRIntegrationTest >> buildRootDirectory [
	"Answer the folder in which each test creates its project: the temporary folder of the system, or the folder of the image when the first cannot be written."

	^ self buildRootDirectoryAmong: self buildRootDirectoryCandidates
]

{ #category : 'helpers' }
PRIntegrationTest >> buildRootDirectoryAmong: directories [
	"Answer the first of directories that exists and can be written."

	^ directories
		  detect: [ :each | each exists and: [ each isWritable ] ]
		  ifNone: [
				  self error: (String streamContents: [ :stream |
							   stream nextPutAll:
								   'No writable folder to build the test projects in. Tried: '.
							   directories
								   do: [ :each | stream nextPutAll: each fullName ]
								   separatedBy: [ stream nextPutAll: ', ' ] ]) ]
]

{ #category : 'helpers' }
PRIntegrationTest >> buildRootDirectoryCandidates [

	^ {
		  FileLocator temp asFileReference.
		  FileLocator imageDirectory asFileReference }
]

{ #category : 'helpers' }
PRIntegrationTest >> buildSite: archetypeName [
	"Build the archetype as pillar build site does."

	^ self
		  build: archetypeName
		  with: PRHtmlBookOutput new
		  strategy: PRBuildRootMainStrategy new
]

{ #category : 'helpers' }
PRIntegrationTest >> buildSlides: archetypeName [
	"Build the lecture of a mooc archetype as pillar build pdf Lecture1.md does."

	^ self
		  build: archetypeName
		  with: PRPdfOutput new
		  strategy: (PRBuildListStrategy list: #( 'Lecture1.md' ))
]

{ #category : 'helpers' }
PRIntegrationTest >> htmlFileNamesIn: aDirectory [

	^ (aDirectory children select: [ :each | each extension = 'html' ])
		  collect: [ :each | each basename ]
		  as: Set
]

{ #category : 'helpers' }
PRIntegrationTest >> includeGraphicsLineFor: aFile width: aString [
	"Answer the LaTeX line including the figure aFile, as the LaTeX writer generates it."

	^ String streamContents: [ :stream |
			  stream
				  nextPutAll: '\includegraphics[width=';
				  nextPutAll: aString;
				  nextPutAll: '\textwidth]{';
				  nextPutAll: aFile fullName;
				  nextPut: $} ]
]

{ #category : 'helpers' }
PRIntegrationTest >> isLatexmkAvailable [
	"Answer whether latexmk, used to build PDFs, can be run on this machine."

	OSPlatform current isWindows ifTrue: [ ^ false ].
	^ [
		  (OSSUnixSubprocess new
			   command: 'latexmk';
			   arguments: #( '-v' );
			   redirectStdout;
			   redirectStderr;
			   runAndWait;
			   yourself) isSuccess ]
		  on: Error
		  do: [ false ]
]

{ #category : 'helpers' }
PRIntegrationTest >> isRaisedByLatexmk: anError [
	"Answer whether anError was raised while Pillar ran latexmk on the generated LaTeX file."

	| context |
	context := anError signalerContext.
	[ context isNil ] whileFalse: [
			context method == (PRPDFDocument >> #postWriteTransform:) ifTrue: [
				^ true ].
			context := context sender ].
	^ false
]

{ #category : 'helpers' }
PRIntegrationTest >> linesOf: aString from: startMarker to: endMarker [
	"Answer the lines of aString from the line holding startMarker to the line holding endMarker, both included: a part taken from the middle of a generated file."

	| start |
	start := aString indexOfSubCollection: startMarker.
	self assert: start > 0.
	^ (aString
		   copyFrom: start
		   to: (aString indexOfSubCollection: endMarker startingAt: start)
			   + endMarker size - 1) lines
]

{ #category : 'helpers' }
PRIntegrationTest >> secondSlideLines [
	"The second slide of the Lecture1.md sample of both mooc archetypes, as LaTeX lines."

	^ #( '\frametitle{Second slide}' '\begin{columns}' '\begin{column}{0.5\textwidth}'
	     '' '\begin{itemize}' '    \item First column'
	     '    \item 1122' '    \item 1133' '\end{itemize}'
	     '\end{column}' '' '\begin{column}{0.5\textwidth}'
	     '' '\begin{itemize}' '    \item Second column'
	     '    \item 2222' '    \item 2233' '\end{itemize}'
	     '\end{column}' '' '\end{columns}' )
]

{ #category : 'running' }
PRIntegrationTest >> setUp [

	super setUp.
	projectDirectory := (self buildRootDirectory
	                     / ('pillar-integration-' , UUID new asString))
		                    ensureCreateDirectory.
	project := PRProject on: projectDirectory
]

{ #category : 'helpers' }
PRIntegrationTest >> skipUnlessLatexmkIsAvailable [
	"Skip a PDF test on a machine that cannot run latexmk."

	self isLatexmkAvailable ifFalse: [
		self skip: 'latexmk is not available' ]
]

{ #category : 'running' }
PRIntegrationTest >> tearDown [

	projectDirectory ensureDeleteAll.
	super tearDown
]

{ #category : 'tests' }
PRIntegrationTest >> testBasicLatexReportHtml [

	| result page |
	result := self buildHtml: 'basic-latex-report'.
	page := (result / 'index.html') contents.

	self assert: (page includesSubstring: '_support/html/css/book.css').
	self assert:
		(page includesSubstring: '<h2>Edition and Templates</h2>')
]

{ #category : 'tests' }
PRIntegrationTest >> testBasicLatexReportSite [

	| result |
	result := self buildSite: 'basic-latex-report'.

	self
		assert: (self htmlFileNamesIn: result)
		equals: #( 'index.html' 'my-first-book-using-microdown.html'
			   'compilation.html' 'edition-and-templates.html' ) asSet.
	self assert:
		(result / 'Chapters' / 'Chapter2' / 'figures' / 'rmod.png') exists.
	self assert:
		((result / 'compilation.html') contents includesSubstring:
			 '<h2 id="compilation"><span class="number">1</span> Compilation</h2>')
]

{ #category : 'tests' }
PRIntegrationTest >> testBodBookLatex2026Html [

	| result page |
	result := self buildHtml: 'bod-book-latex2026'.
	page := (result / 'index.html') contents.

	self assert: (page includesSubstring: '_support/html/css/book.css').
	self assert:
		(result / '_support' / 'html' / 'css' / 'book.css') exists.
	self assert: (page includesSubstring:
			 '<h2>Microdown syntax</h2><a id="chapSyntax"></a>')
]

{ #category : 'tests' }
PRIntegrationTest >> testBodBookLatex2026LaTeX [

	| tex |
	tex := ((self buildLaTeX: 'bod-book-latex2026') / 'index.tex')
		       contents.

	self
		assert: (self
				 linesOf: tex
				 from: '\chapter{Anchors, references and numbers}'
				 to: '\section{Anchors}\label{secAnchors}')
		equals:
			#( '\chapter{Anchors, references and numbers}\label{chapReferences}'
			   'Books refer to their own parts: \textit{see Section 2.3}, \textit{as shown in Figure 1.1}.'
			   'Microdown separates the two sides of such a link.'
			   'An \textbf{anchor} names an element, and a \textbf{reference} points to the anchor.'
			   'When the book is built, chapters, sections, figures, listings and equations get numbers,'
			   'and each reference shows the number of its target.'
			   'You never write a number yourself, so numbers stay right when you move things around.'
			   '' '\section{Anchors}\label{secAnchors}' ).
	self
		assert:
		(self linesOf: tex from: '\begin{figure}' to: '\end{figure}')
		equals: {
				'\begin{figure}[htpb]'.
				'\begin{center}'.
				(self
					 includeGraphicsLineFor:
					 projectDirectory / 'Chapters' / 'Chapter1' / 'figures'
					 / 'pillar.png'
					 width: '0.4').
				'\caption{The Pillar logo.}\label{figPillar}'.
				'\end{center}'.
				'\end{figure}' }
]

{ #category : 'tests' }
PRIntegrationTest >> testBodBookLatex2026Site [

	| result |
	result := self buildSite: 'bod-book-latex2026'.

	self
		assert: (self htmlFileNamesIn: result)
		equals: #( 'index.html' 'chapSyntax.html' 'chapReferences.html'
			   'extensions.html' 'less-known-features.html'
			   'chapSite.html' 'chapCheckers.html' ) asSet.
	self assert:
		(result / '_support' / 'html' / 'css' / 'book.css') exists.
	self assert:
		(result / 'Chapters' / 'Chapter1' / 'figures' / 'pillar.png') exists.
	self assert:
		((result / 'chapSyntax.html') contents includesSubstring:
			 '<img src="Chapters/Chapter1/figures/pillar.png"').
	self assert:
		((result / 'chapReferences.html') contents includesSubstring:
			 '<h3><span class="number">2.2</span> References</h3><a id="secReferences"></a>')
]

{ #category : 'tests - build folder' }
PRIntegrationTest >> testBuildRootDirectoryIsTheFirstWritableCandidate [

	| fileSystem |
	fileSystem := FileSystem memory.
	(fileSystem / 'image') ensureCreateDirectory.

	self
		assert: (self buildRootDirectoryAmong: {
					 (fileSystem / 'missingTemp').
					 (fileSystem / 'image') })
		equals: fileSystem / 'image'
]

{ #category : 'tests - build folder' }
PRIntegrationTest >> testBuildRootDirectoryPrefersTheTemporaryFolder [

	self
		assert: self buildRootDirectoryCandidates first
		equals: FileLocator temp asFileReference.
	self
		assert: self buildRootDirectoryCandidates second
		equals: FileLocator imageDirectory asFileReference
]

{ #category : 'tests - errors' }
PRIntegrationTest >> testBuildRootDirectoryWithoutWritableCandidateRaisesError [

	| fileSystem |
	fileSystem := FileSystem memory.

	self
		should: [
				self buildRootDirectoryAmong: {
						(fileSystem / 'missingTemp').
						(fileSystem / 'missingImage') } ]
		raise: Error
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring: 'missingTemp').
				self assert: (error messageText includesSubstring: 'missingImage') ]
]

{ #category : 'tests - helpers' }
PRIntegrationTest >> testIsRaisedByLatexmkIgnoresOtherErrors [

	[ self error: 'not latexmk' ]
		on: Error
		do: [ :error | self deny: (self isRaisedByLatexmk: error) ]
]

{ #category : 'tests' }
PRIntegrationTest >> testMicrodownHeaderFormatMoocSlides [

	| result |
	self skipUnlessLatexmkIsAvailable.
	result := self buildSlides: 'microdown-headerformat-mooc'.

	self assert: (result / 'Lecture1.pdf') exists.
	self
		assert: (self
				 linesOf: (result / 'Lecture1.tex') contents
				 from: '\frametitle{Second slide}'
				 to: '\end{columns}')
		equals: self secondSlideLines
]

{ #category : 'tests' }
PRIntegrationTest >> testMicrodownMoocSlides [

	| result |
	self skipUnlessLatexmkIsAvailable.
	result := self buildSlides: 'microdown-mooc'.

	self assert: (result / 'Lecture1.pdf') exists.
	self
		assert: (self
				 linesOf: (result / 'Lecture1.tex') contents
				 from: '\frametitle{Second slide}'
				 to: '\end{columns}')
		equals: self secondSlideLines
]

{ #category : 'tests' }
PRIntegrationTest >> testWelcomeHtml [

	| page |
	page := ((self buildHtml: 'welcome') / 'index.html') contents.

	self assert: (page includesSubstring: '_support/html/css/book.css').
	self assert: (page includesSubstring: '<h2>Hello World</h2>').
	self assert: (page includesSubstring: '<h2>Credits</h2>')
]

{ #category : 'tests' }
PRIntegrationTest >> testWelcomeSite [

	| result |
	result := self buildSite: 'welcome'.

	self
		assert: (self htmlFileNamesIn: result)
		equals: #( 'index.html' 'hello-world.html' 'credits.html' ) asSet.
	self assert: ((result / 'credits.html') contents includesSubstring:
			 '<h2 id="credits"><span class="number">2</span> Credits</h2>')
]
