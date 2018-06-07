Class {
	#name : #PRLaTeXWriterTest,
	#superclass : #PRDocumentWriterTest,
	#category : 'Pillar-Tests-ExporterLaTeX'
}

{ #category : #testing }
PRLaTeXWriterTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRLaTeXWriterTest >> actualClass [
	^ PRLaTeXWriter
]

{ #category : #private }
PRLaTeXWriterTest >> annotationBegin: annotationString [
	^ '\begin{' , annotationString , '}'.
	
]

{ #category : #requirements }
PRLaTeXWriterTest >> boldFoo [
	^ '\textbf{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> citationRepresentation [
	^'\cite{hello}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> dataItemWithBar [
	^ ' bar'
]

{ #category : #requirements }
PRLaTeXWriterTest >> definitionListBegin [
	^ '\begin{description}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> emailToFoo [
	^ '\href{mailto:foo@bar.com'
]

{ #category : #requirements }
PRLaTeXWriterTest >> figureAnchorForPierLogo [
	^ '\label{pierLogo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> figureBegin [
	^ '\begin{figure}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> footnoteBar [
	^ '\footnote{Bar}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> horizontalRule [
	^ '\rule{\textwidth}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> italicFoo [
	^ '\textit{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> level1HeaderBegin [
	^ '\part{'
]

{ #category : #requirements }
PRLaTeXWriterTest >> level1HeaderWithFoo [
	^ '\part{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> level2HeaderBegin [
	^ '\chapter{'
]

{ #category : #requirements }
PRLaTeXWriterTest >> level3HeaderBegin [
	^ '\section{'
]

{ #category : #requirements }
PRLaTeXWriterTest >> listItemWith1 [
	^ '\item 1'
]

{ #category : #requirements }
PRLaTeXWriterTest >> monospaceFoo [
	^ '\code{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> orderedListBegin [
	^ '\begin{enumerate}'
]

{ #category : #accessing }
PRLaTeXWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterLaTeX')
]

{ #category : #requirements }
PRLaTeXWriterTest >> paragraphFoo [
	| newLine |
	newLine := self configuration newLine.
	^ 'foo', newLine
]

{ #category : #requirements }
PRLaTeXWriterTest >> preformattedFooBegin [
	^ '\begin{verbatim}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> preformattedTextFoo [
	^ 'foo'
]

{ #category : #requirements }
PRLaTeXWriterTest >> rawText [
	^ '\textbf{\textit{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> referenceToFigurePierLogo [
	^ '\ref{pierLogo}'
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithRefWithAnchorWithSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithRefWithAnchorWithoutSeparateOutputFiles [
	^ '\hyperref[foo]'
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithRefWithoutAnchorWithSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithRefWithoutAnchorWithoutSeparateOutputFiles [
	^ ''
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles [
	^ '\ref{foo}'
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '\ref{foo}'
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles [
	^ '\ref{foo}'
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	^ '\hyperref[foo]'
]

{ #category : #'requirement-InternalLinks' }
PRLaTeXWriterTest >> resultWithoutRefWithAnchorWithoutSeparateOutputFiles [
	^ '\hyperref[foo]'
]

{ #category : #requirements }
PRLaTeXWriterTest >> scriptAnchorForMyScript [
	^ 'label=myScript'
]

{ #category : #requirements }
PRLaTeXWriterTest >> scriptWithCaptionBegin [
	^ '\begin{listing}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> scriptWithoutCaptionBegin [
	^ '\begin{listing}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> strikethroughFoo [
	^ '\sout{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> subscriptFoo [
	^ '\textsubscript{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> superscriptFoo [
	^ '\textsuperscript{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> tableBegin [
	^ '\begin{tabular}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> tableCellWithFoo [
	^ 'foo'
]

{ #category : #requirements }
PRLaTeXWriterTest >> tableCellWithHeadingFoo [
	^ '\textbf{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> tableRow [
	^ '\\'
]

{ #category : #requirements }
PRLaTeXWriterTest >> termItemWithFoo [
	^ '\item[foo]'
]

{ #category : #tests }
PRLaTeXWriterTest >> testAnchor [
	| item |
	item := PRAnchor new name: 'foo'.
	self assertWriting: item includesText: '\label{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> testExportCitation [

	| item |
	item := PRDocument new
		add: (PRCitation ref: 'hello');
		yourself.
	self
		assertWriting: item
		includesText: self citationRepresentation.
]

{ #category : #'tests-internalLinks' }
PRLaTeXWriterTest >> testExternalLinkWithCaptionShouldPrintUrlAsFootnote [
	| link |
	link := self addText: 'Pharo' to: (PRExternalLink reference: 'http://www.pharo.org').
	self assertWriting: link includesText: '\href{http://www.pharo.org}{Pharo}\footnote{\url{http://www.pharo.org}}'
]

{ #category : #'tests-internalLinks' }
PRLaTeXWriterTest >> testExternalLinkWithCaptionShouldProtectUrlInFootnotes [
	| link |
	link := self addText: 'Launcher' to: (PRExternalLink reference: 'http://www.smalltalkhub.com/#!/~Pharo/PharoLauncher').
	self assertWriting: link includesText: '\footnote{\url{http://www.smalltalkhub.com/\#!/~Pharo/PharoLauncher}}'
]

{ #category : #tests }
PRLaTeXWriterTest >> testFigureCaptionWithNonTextChildren [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (self addText: 'foo' to: PRBoldFormat new);
		yourself.
	self assertWriting: item includesText: self boldFoo
]

{ #category : #tests }
PRLaTeXWriterTest >> testFigureLabelNotEscaped [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		label: 'a_b';
		yourself.
	self assertWriting: item includesText: 'a_b'
]

{ #category : #'tests-internalLinks' }
PRLaTeXWriterTest >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self should: [ resultString := self write: item ] raise: PRLinkWarning.
	[  resultString := self write: item ] on: PRLinkWarning do: [:w | w resume ].
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRLaTeXWriterTest >> testInternalLinkWithoutAliasWithRefWithAncorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref@foo');
		yourself.
	self should: [ resultString := self writeWithSeparateOutputFiles: item ] raise: PRLinkWarning.
	[ resultString := self writeWithSeparateOutputFiles: item ]
		on: PRLinkWarning
		do: [ :w | w resume ].
	self resultWithRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithSeparateOutputFiles) ]
]

{ #category : #'tests-internalLinks' }
PRLaTeXWriterTest >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref');
		yourself.
	self should: [ resultString := self writeWithSeparateOutputFiles: item ] raise: PRLinkWarning.
	[ resultString := self writeWithSeparateOutputFiles: item ]
		on: PRLinkWarning
		do: [ :w | w resume ].
	self resultWithRefWithoutAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithSeparateOutputFiles) ]
]

{ #category : #'tests-internalLinks' }
PRLaTeXWriterTest >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self should: [ resultString := self write: item ] raise: PRLinkWarning.
	[ resultString := self write: item ]
		on: PRLinkWarning
		do: [ :w | w resume ].
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ]
]

{ #category : #tests }
PRLaTeXWriterTest >> testLinksWithBadCharactersInCaption [
	| item url caption |
	url := 'http://www.pharo.org'.
	caption := 'bad chars #_'.
	item := PRExternalLink new
		reference: url;
		add: (PRText content: caption);
		yourself.
	self assertWriting: item includesText: 'bad chars \#\_'
]

{ #category : #tests }
PRLaTeXWriterTest >> testLinksWithEitherHrefOrUrl [
	| item url caption |
	url := 'http://www.pharo.org#foo'.
	caption := 'some caption'.
	item := PRExternalLink new reference: url.
	self assertWriting: item includesText: '\url{' , url , '}'.
	item := PRExternalLink new
		reference: url;
		add: (PRText content: caption);
		yourself.
	self assertWriting: item includesText: '\href{' , url , '}{' , caption , '}'
]

{ #category : #tests }
PRLaTeXWriterTest >> testPreformattedExportsToUnprotectedVerbatim [
	"Special characters in a Pillar preformattted group should not be protected by backslashes because they are exported in a verbatim LaTeX environment."

	| item |
	item := PRPreformatted with: (PRText content: '[[[').
	self
		assertWriting: item
		includesText: self preformattedFooBegin , self configuration newLine , '[[[' , self configuration newLine
]

{ #category : #tests }
PRLaTeXWriterTest >> testReferencesToSectionsAreNotEscaped [
	|item|
	item := PRInternalLink reference: '@a_section_somewhere'.
	self assertWriting: item includesText: 'a_section_somewhere'
]

{ #category : #tests }
PRLaTeXWriterTest >> testScriptWithCorrectNewLines [
	| item |
	item := (PRCodeblock content: 'foo')
		label: 'myScript';
		caption: 'a caption';
		yourself.
	self
		assertWriting: item
		includesText:
			self configuration newLine , 'foo' , self configuration newLine , '\end{'
]

{ #category : #tests }
PRLaTeXWriterTest >> testStrictLineBreaksInAnnotatedParagraphs [
	| item lineBreak |
	item := self
		addText: 'Blah'
		to:
			(PRAnnotatedParagraph new
				annotation: 'note';
				yourself).
	lineBreak := self configuration newLine.
	self assertWriting: item includesText: '\begin{note}' , lineBreak , 'Blah' , lineBreak , '\end{note}' , lineBreak
]

{ #category : #tests }
PRLaTeXWriterTest >> testTableWith2CellsInARow [
	| item |
	item := super testTableWith2CellsInARow.
	self assertWriting: item includesText: 'foo & foo \\'
	
]

{ #category : #tests }
PRLaTeXWriterTest >> testTablesHaveSeparatingLines [
	| text |
	text := '|!Syntax |!What it represents
|startPoint|a variable name'.
	self assertWriting: (self parser parse: text) includesTexts: { 'toprule' . 'midrule' . 'bottomrule' }
]

{ #category : #tests }
PRLaTeXWriterTest >> testThereIsABlankLineBetweenTextAndTable [
	| text nLine |
	nLine := Smalltalk os lineEnding.
	text := 'This is a table:
| foo
| bar'.
	self
		assertWriting: (self parser parse: text)
		includesText: 'This is a table:' , nLine , nLine , '\begin{tab'
]

{ #category : #'tests-internalLinks' }
PRLaTeXWriterTest >> testUrlsAreProtected [
	| writer |
	writer := self createWriterOn: String new.
	self assert: (writer protectUrl: '#') equals: '\#'.
	self assert: (writer protectUrl: '~') equals: '~'.
	self assert: (writer protectUrl: '&') equals: '&'.
	self assert: (writer protectUrl: '%') equals: '\%'.
	self assert: (writer protectUrl: '\') equals: '\\'.
	self assert: (writer protectUrl: '\~#%') equals: '\\~\#\%'.
]

{ #category : #requirements }
PRLaTeXWriterTest >> underlineFoo [
	^ '\uline{foo}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> unorderedListBegin [
	^ '\begin{itemize}'
]

{ #category : #requirements }
PRLaTeXWriterTest >> widthFor50percents [
	^ '0.5'
]
