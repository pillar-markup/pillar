"
I am a writer for CommonMark
http://spec.commonmark.org/0.28/
"
Class {
	#name : #PRMarkdownWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting'
	],
	#category : 'Pillar-ExporterMarkdown'
}

{ #category : #accessing }
PRMarkdownWriter class >> fileExtension [
	^ 'md'
]

{ #category : #accessing }
PRMarkdownWriter class >> folderName [
	^ #markdown
]

{ #category : #accessing }
PRMarkdownWriter class >> writerName [
	^ #markdown
]

{ #category : #accessing }
PRMarkdownWriter >> canvasClass [
	^ PRMarkdownCanvas
]

{ #category : #'as yet unclassified' }
PRMarkdownWriter >> createAnchorWith: aString [ 
	self shouldBeImplemented.
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> nest: aString do: aBlock [
	nesting add: aString.
	aBlock ensure: [ nesting removeLast ]
]

{ #category : #protected }
PRMarkdownWriter >> scriptLayout: aScript [
	| text lines |
	text := aScript text.
	lines := (text substrings: self configuration newLine)
		collect: [ :each | '    ' , each , self configuration newLine ].
	canvas raw: lines.
]

{ #category : #visiting }
PRMarkdownWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
	"Annotations need to be defined as block quotes. For example...
		@@note 
		@@dothis
	could have...
	 	> Note:
		> DoThis:
	"

	canvas writeBlockQuoteDuring: [
		canvas
			bold: anAnnotatedParagraph annotation;
			raw: ': '.
		self visitParagraph: anAnnotatedParagraph
	]
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitBoldFormat: aFormat [
	"http://spec.commonmark.org/0.28/#emphasis-and-strong-emphasis"

	canvas bold: aFormat text
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitCodeblock: aCodeBlock [

	"Markdown by default does not support labels nor captions in scripts"
	aCodeBlock hasLabel ifTrue: [ 
		Warning signal: 'Unsupported feature: Markdown writer does not support code block labels' ].
	aCodeBlock hasCaption ifTrue: [ 
		Warning signal: 'Unsupported feature: Markdown writer does not support code block captions' ].
	self writeScript: aCodeBlock.
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitDataItem: anObject [
	
	canvas raw: anObject text
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitDefinitionList: anObject [
	canvas potentialNewLine.
	self nest: '- ' do: [ super visitDefinitionList: anObject ]
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitExternalLink: anExternalLink [
	"http://spec.commonmark.org/0.28/#links"

	self writeExternalLink: anExternalLink
]

{ #category : #visiting }
PRMarkdownWriter >> visitFigure: aFigure [
	"http://spec.commonmark.org/0.28/#images"

	canvas raw: '!['.
	aFigure hasLabel ifTrue: [ canvas raw: aFigure label ].
	canvas raw: '](' , aFigure localFileOrExternalReference.
	aFigure hasCaption ifTrue: [ canvas raw: ' "' , aFigure text , '"' ].
	canvas raw: ')'
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitHeader: aHeader [
	"http://spec.commonmark.org/0.28/#atx-headings"

	| level |
	level := aHeader level min: 6 max: 1.
	1 to: level do: [ :each | canvas nextPut: $# ].
	canvas nextPut: Character space.
	self writeCounterForHeader: aHeader.
	canvas raw: aHeader text trimmed.
	canvas newLine
]

{ #category : #visiting }
PRMarkdownWriter >> visitHorizontalRule: anHorizontalRule [
	"http://spec.commonmark.org/0.28/#thematic-breaks"
	
	"The result is line, so using dashes and not e.g. asterisks would make more sense."

	canvas
		newLine;
		newLine.
	canvas raw: '---'.
	canvas newLine
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitInternalLink: anInternalLink [
	| href |
	href := String new.
	anInternalLink hasReference ifTrue: [ href := href , anInternalLink referenceAsHTML ].
	anInternalLink hasAnchor ifTrue: [ href := href , '#' , anInternalLink anchor ].
	self writeInternalLink: anInternalLink withRef: href.
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitItalicFormat: aFormat [
	"http://spec.commonmark.org/0.28/#emphasis-and-strong-emphasis"

	canvas raw: '*' , aFormat text , '*'
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitListItem: aListItem [
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"

	nesting last isInteger ifTrue: [ nesting addLast: nesting removeLast + 1 ].
	nesting size - 1 timesRepeat: [ canvas raw: '  ' ].
	canvas nextPutAll: nesting last asString.
	canvas nextPutAll: (nesting last isInteger 
			ifTrue: [ '. ' ]
			ifFalse: [ ' ' ]).
	self visitDocumentGroup: aListItem.
	canvas potentialNewLine
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitMailLink: aMail [

	canvas
		writeLinkDuring: [ self visitAll: aMail children ]
		destination: aMail unscrambledUrl.
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitMonospaceFormat: aFormat [
	"http://spec.commonmark.org/0.28/#code-spans"

	canvas raw: '`' , aFormat text , '`'
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitOrderedList: aList [
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"

	canvas potentialNewLine.
	aList children
		withIndexDo: [ :each :i | self nest: i asString , '.' do: [ self visit: each ] ]
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitParagraph: aParagraph [
	self visitDocumentGroup: aParagraph.
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitPreformatted: aPreformatted [
	
	canvas writeIndentedCodeBlockDuring: [
		aPreformatted children
			do: [ :child | self visit: child ]
			separatedBy: [canvas newLine ] ]

]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitTermItem: anObject [
	
	canvas
		raw: '- ';
		bold: anObject text;
		raw: '.'
]

{ #category : #'visiting-document' }
PRMarkdownWriter >> visitUnorderedList: aList [
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"
	canvas potentialNewLine.
	self nest: '-' do: [ self visitDocumentGroup: aList ]
]

{ #category : #writing }
PRMarkdownWriter >> writeExternalLink: anExternalLink [
	"http://spec.commonmark.org/0.28/#links"

	canvas
		writeLinkDuring: [ self visitDocumentGroup: anExternalLink ]
		destination: anExternalLink localFileOrExternalReference.
]

{ #category : #writing }
PRMarkdownWriter >> writeInternalLink: anInternalLink withRef: href [
	"http://spec.commonmark.org/0.28/#links"
	canvas
		writeLinkDuring: [ 
			anInternalLink counter isValidCounter
				ifTrue: [ self writeCounter: anInternalLink counter.
					anInternalLink hasAlias
						ifTrue: [ canvas nextPutAll: ' ' ] ].
			anInternalLink hasAlias
				ifTrue: [ canvas nextPutAll: anInternalLink alias ]. ]
		destination: href
]

{ #category : #writing }
PRMarkdownWriter >> writeScript: aScript [
	"http://spec.commonmark.org/0.28/#fenced-code-blocks"

	"I am not using indented code blocks (http://spec.commonmark.org/0.28/#indented-code-blocks), because they have no info strings (http://spec.commonmark.org/0.28/#info-string)"

	| language |
	canvas
		newLine;
		raw: '```'.
	language := self languageForScript: aScript.
	language isSyntaxHighlightingPossible
		ifTrue: [ canvas raw: language originalName ].
	canvas
		newLine;
		raw: aScript text;
		newLine;
		raw: '```';
		newLine
]
