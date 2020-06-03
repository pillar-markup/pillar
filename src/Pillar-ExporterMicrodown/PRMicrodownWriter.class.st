Class {
	#name : #PRMicrodownWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
PRMicrodownWriter class >> fileExtension [
	^ 'md'
]

{ #category : #accessing }
PRMicrodownWriter class >> folderName [
	^ #markdown
]

{ #category : #accessing }
PRMicrodownWriter class >> writerName [
	^ #markdown
]

{ #category : #accessing }
PRMicrodownWriter >> canvasClass [
	^ PRMicrodownCanvas
]

{ #category : #'as yet unclassified' }
PRMicrodownWriter >> createAnchorWith: aString [ 
	self shouldBeImplemented.
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> nest: aString do: aBlock [
	nesting add: aString.
	aBlock ensure: [ nesting removeLast ]
]

{ #category : #protected }
PRMicrodownWriter >> scriptLayout: aScript [
	| text lines |
	text := aScript text.
	lines := (text substrings: self configuration newLine)
		collect: [ :each | '    ' , each , self configuration newLine ].
	canvas raw: lines.
]

{ #category : #visiting }
PRMicrodownWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
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
PRMicrodownWriter >> visitBoldFormat: aFormat [
	"http://spec.commonmark.org/0.28/#emphasis-and-strong-emphasis"

	canvas bold: aFormat text
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitCodeblock: aCodeBlock [

	"Markdown by default does not support labels nor captions in scripts"
	aCodeBlock hasLabel ifTrue: [ 
		Warning signal: 'Unsupported feature: Markdown writer does not support code block labels' ].
	aCodeBlock hasCaption ifTrue: [ 
		Warning signal: 'Unsupported feature: Markdown writer does not support code block captions' ].
	self writeScript: aCodeBlock.
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitDataItem: anObject [
	
	canvas raw: anObject text
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitDefinitionList: anObject [
	canvas potentialNewLine.
	self nest: '- ' do: [ super visitDefinitionList: anObject ]
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitExternalLink: anExternalLink [
	"http://spec.commonmark.org/0.28/#links"

	self writeExternalLink: anExternalLink
]

{ #category : #visiting }
PRMicrodownWriter >> visitFigure: aFigure [
	"http://spec.commonmark.org/0.28/#images"

	canvas raw: '!['.
	aFigure hasLabel ifTrue: [ canvas raw: aFigure label ].
	canvas raw: '](' , aFigure localFileOrExternalReference.
	aFigure hasCaption ifTrue: [ canvas raw: ' "' , aFigure text , '"' ].
	canvas raw: ')'
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitHeader: aHeader [
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
PRMicrodownWriter >> visitHorizontalRule: anHorizontalRule [
	"http://spec.commonmark.org/0.28/#thematic-breaks"
	
	"The result is line, so using dashes and not e.g. asterisks would make more sense."

	canvas
		newLine;
		newLine.
	canvas raw: '---'.
	canvas newLine
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitInternalLink: anInternalLink [
	| href |
	href := String new.
	anInternalLink hasReference ifTrue: [ href := href , anInternalLink referenceAsHTML ].
	anInternalLink hasAnchor ifTrue: [ href := href , '#' , anInternalLink anchor ].
	self writeInternalLink: anInternalLink withRef: href.
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitItalicFormat: aFormat [
	"http://spec.commonmark.org/0.28/#emphasis-and-strong-emphasis"

	canvas raw: '*' , aFormat text , '*'
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitListItem: aListItem [
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
PRMicrodownWriter >> visitMailLink: aMail [

	canvas
		writeLinkDuring: [ self visitAll: aMail children ]
		destination: aMail unscrambledUrl.
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitMonospaceFormat: aFormat [
	"http://spec.commonmark.org/0.28/#code-spans"

	canvas raw: '`' , aFormat text , '`'
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitOrderedList: aList [
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"

	canvas potentialNewLine.
	aList children
		withIndexDo: [ :each :i | self nest: i asString , '.' do: [ self visit: each ] ]
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitParagraph: aParagraph [
	self visitDocumentGroup: aParagraph.
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitPreformatted: aPreformatted [
	
	canvas writeIndentedCodeBlockDuring: [
		aPreformatted children
			do: [ :child | self visit: child ]
			separatedBy: [canvas newLine ] ]

]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitTermItem: anObject [
	
	canvas
		raw: '- ';
		bold: anObject text;
		raw: '.'
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitUnorderedList: aList [
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"
	canvas potentialNewLine.
	self nest: '-' do: [ self visitDocumentGroup: aList ]
]

{ #category : #writing }
PRMicrodownWriter >> writeExternalLink: anExternalLink [
	"http://spec.commonmark.org/0.28/#links"

	canvas
		writeLinkDuring: [ self visitDocumentGroup: anExternalLink ]
		destination: anExternalLink localFileOrExternalReference.
]

{ #category : #writing }
PRMicrodownWriter >> writeInternalLink: anInternalLink withRef: href [
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
PRMicrodownWriter >> writeScript: aScript [
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
