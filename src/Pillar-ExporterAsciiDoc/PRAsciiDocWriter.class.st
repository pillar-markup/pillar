"
Write a Pillar document to an AsciiDoc document
"
Class {
	#name : #PRAsciiDocWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting',
		'annotatedKeywords'
	],
	#category : 'Pillar-ExporterAsciiDoc'
}

{ #category : #accessing }
PRAsciiDocWriter class >> fileExtension [
	^ 'asciidoc'
]

{ #category : #accessing }
PRAsciiDocWriter class >> folderName [
	^ #asciidoc
]

{ #category : #testing }
PRAsciiDocWriter class >> isAbstract [
	^ false
]

{ #category : #accessing }
PRAsciiDocWriter class >> writerName [
	^ #asciidoc
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> addAnnotatedKeywords: aString to: aKey [ 
	annotatedKeywords at: aKey put: aString
]

{ #category : #accessing }
PRAsciiDocWriter >> annotatedKeywords [
	^ annotatedKeywords 
]

{ #category : #accessing }
PRAsciiDocWriter >> canvasClass [

	^ PRAsciiDocCanvas
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> createAnchorWith: anId [
	canvas surround: anId with: '[[' and: ']]'
]

{ #category : #initialization }
PRAsciiDocWriter >> initAnnotatedKeywords [
	self addAnnotatedKeywords: 'CAUTION:' to: 'caution';
		  addAnnotatedKeywords: 'IMPORTANT:' to: 'important';
		  addAnnotatedKeywords: 'IMPORTANT:' to: 'todo';
		  addAnnotatedKeywords: 'NOTE:' to: 'note';
		  addAnnotatedKeywords: 'NOTE:' to: 'annotation';
		  addAnnotatedKeywords: 'NOTE:' to: 'comment';
		  addAnnotatedKeywords: 'TIP:' to: 'tip';
		  addAnnotatedKeywords: 'TIP:' to: 'tips';
		  addAnnotatedKeywords: 'WARNING:' to: 'warning'.
]

{ #category : #initialization }
PRAsciiDocWriter >> initialize [
	super initialize.
	annotatedKeywords := Dictionary new.
	self initAnnotatedKeywords.
]

{ #category : #'writing-text' }
PRAsciiDocWriter >> link: anUrl named: name [
	stream 
		<< anUrl
		<< '[' << name << ']'
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> nest: aString do: aBlock [
	nesting add: aString.
	aBlock ensure: [ nesting removeLast ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> searchAnnotation: anAnnotationName [
	^ annotatedKeywords at: anAnnotationName ifAbsent: [ '' ].
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> searchParam: aString in: aFigure [
"Search in the figure parameters if the parameter aString is present and return the parameter and its value folowing the scheme param=""value"" "
	^
		aFigure parameters
			at: aString
			ifPresent: [ :param |  aString, '="', param asString, '"']
			ifAbsent: [ '' ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject.
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitAnchor: anAnchor [
	self createAnchorWith: anAnchor name
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
	
	|annotation|
	annotation := self searchAnnotation: anAnnotatedParagraph annotation.
	
	canvas precede: [ super visitParagraph: anAnnotatedParagraph ] by: (annotation, (annotation isEmpty ifTrue:[''] ifFalse:[' ']) ).
	canvas potentialNewLine.  
	
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitBoldFormat: aFormat [
	canvas surround: [super visitBoldFormat: aFormat] with: '*'
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitCodeblock: aCodeBlock [
	|language   params |
	
	aCodeBlock hasLabel
		ifTrue: [ self createAnchorWith: aCodeBlock label ].
	
	params := ''.
	
	language := self languageForScript: aCodeBlock.
	language isSyntaxHighlightingPossible
		ifTrue: [ params := 'source,', language  printString, ','].
	
	stream << '[' << params << 'caption="' << (self getStringForAll: aCodeBlock caption children) << '"]'.
	canvas newLine.
	stream << '----'.
	canvas newLine.
	stream << [ super visitCodeblock: aCodeBlock ].
	canvas newLine.
	stream << '----'
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitDataItem: anObject [
	self nest: '::' do: [ super visitDataItem: anObject ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitDefinitionList: anObject [
	canvas potentialNewLine.
	self nest: '' do: [ super visitDefinitionList: anObject ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitExternalLink: anExternalLink [
	self link: anExternalLink localFileOrExternalReference named: [ stream << anExternalLink text ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitFigure: aFigure [
	
	| parameters |
	parameters := Set  new.
	
	parameters add: (self searchParam: 'width' in: aFigure);
				  add: ('caption="', (self getStringForAll: aFigure children) ,'"').
		
	aFigure label ifNotNil: [ :label | self createAnchorWith: label ].
	
	canvas potentialNewLine;
			 surround: (aFigure localFileOrExternalReference) with: 'image::' and: '[',parameters asCommaString ,']'.
]

{ #category : #'visiting-annotations' }
PRAsciiDocWriter >> visitFootnote: aFootnote [
	canvas precede: ('[', (aFootnote note) , ']') by: 'footnote:'
	
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitHeader: aHeader [
	aHeader level timesRepeat: [ canvas raw: '=' ].
	canvas space.
	super visitHeader: aHeader.
	canvas newLine
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitHorizontalRule: anHorizontalRule [

	canvas newLine; newLine;
			 raw: '''''''';
			 newLine.
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitInternalLink: anInternalLink [

	|alias|

	alias := 	anInternalLink hasAlias
					ifTrue: [ ',' , anInternalLink alias ]
					ifFalse: [ '' ].

	anInternalLink hasAnchor 
		ifTrue: [ canvas surround: anInternalLink anchor, alias with: '<<' and: '>>']
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitItalicFormat: aFormat [

	canvas surround: [super visitItalicFormat: aFormat] with: ''''
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitListItem: anObject [

	nesting last isInteger ifTrue: [ nesting addLast: nesting removeLast + 1 ].
	nesting size - 1 timesRepeat: [ canvas tab ].
	canvas nextPutAll: nesting last asString.
	canvas nextPutAll: (nesting last isInteger 
			ifTrue: [ '. ' ]
			ifFalse: [ ' ' ]).
	super visitListItem: anObject.
	canvas potentialNewLine
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitMailLink: aMail [
	self link: aMail unscrambledUrl named: [ stream << aMail text ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitMonospaceFormat: aFormat [

	canvas surround: [super visitMonospaceFormat: aFormat] with: '+'
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitOrderedList: anObject [
	canvas newLine.
	self nest: '.' do: [ super visitOrderedList: anObject ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitParagraph: aParagraph [
	super visitParagraph: aParagraph.
	
	canvas potentialNewLine.
	canvas newLine.
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitPreformatted: aPreformatted [

	canvas precede: [ aPreformatted children do: [ :child | self visit: child ] separatedBy: [canvas newLine; raw: ' ' ]] by: ' '
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitStrikethroughFormat: aFormat [

	canvas precede: [super visitStrikethroughFormat: aFormat] by: '[line-through]'
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitSubscriptFormat: aFormat [
	canvas surround: [super visitSubscriptFormat: aFormat] with: '~'
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitSuperscriptFormat: aFormat [
	canvas surround: [super visitSuperscriptFormat: aFormat] with: '^'
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitTable: aTable [

	canvas surround: [super visitTable: aTable] with: '|==='.
	canvas newLine.

]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitTableCell: aCell [

	canvas precede: [ super visitTableCell: aCell ] by: '|'.
	aCell isHeading 
		ifFalse: [canvas newLine].
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitTableRow: aRow [
	
	canvas potentialNewLine.
	canvas newLine.
	super visitTableRow: aRow.

]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitTermItem: anObject [
	self nest: '' do: [ super visitTermItem: anObject ]
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitUnderlineFormat: aFormat [
	
	canvas precede: [super visitStrikethroughFormat: aFormat] by: '[underline]'

	
]

{ #category : #'visiting-document' }
PRAsciiDocWriter >> visitUnorderedList: anObject [
	canvas potentialNewLine.
	self nest: '*' do: [ super visitUnorderedList: anObject ]
]
