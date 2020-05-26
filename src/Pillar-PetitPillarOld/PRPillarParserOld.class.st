"
I am a parser for a Pillar syntax. 
I use the PRPillarGrammar and I build a PRDocument.
"
Class {
	#name : #PRPillarParserOld,
	#superclass : #PRPillarGrammarOld,
	#category : #'Pillar-PetitPillarOld'
}

{ #category : #'grammar - Anchor' }
PRPillarParserOld >> anchor [
	"An anchor is just a line that begin with the character $@ and contains a text that we trim."

	^ super anchor ==> [ :array | PRAnchor named: array second ]
]

{ #category : #'grammar - Paragraph' }
PRPillarParserOld >> annotatedParagraph [
	^ super annotatedParagraph
		==> [ :array | PRAnnotatedParagraph withAll: (array third ifNil: [ {} ] ifNotNil: [ :elem | elem second ]) annotation: array second ]
]

{ #category : #'grammar - Annotation' }
PRPillarParserOld >> annotation [
	^ super annotation
		==>
			[ :array | array second withParametersInCollection: (array third ifNil: [ OrderedDictionary new ]) ]
]

{ #category : #'grammar - Annotation' }
PRPillarParserOld >> annotationParameters [
	^ super annotationParameters ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Annotation' }
PRPillarParserOld >> annotationTag [
	^ super annotationTag
		==> [ :array | | aTag |
				aTag := (self stringFrom: array).
				PRAbstractAnnotation 
					findClassAcceptingTag: aTag
					ifNone: [ PRSyntaxError signal: 'Pillar doesn''t support this tag : ''' , 
						aTag , ''' on his annotations.' ] ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> boldFormat [
	^ super boldFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> boldMarkup [
	^ super boldMarkup ==> [ :token | PRBoldFormat ]
]

{ #category : #'grammar - Text' }
PRPillarParserOld >> commentedLine [
	^ super commentedLine ==> [ :array | PRCommentedLine content: array second ]
]

{ #category : #'grammar - Document' }
PRPillarParserOld >> content [
	^ super content ==> [ :array | array second ifNil: [ {array first} ] ifNotNil: [ array ] ]
]

{ #category : #'grammar - Document' }
PRPillarParserOld >> contents [
	^ super contents
		==> [ :array | 
			| result |
			result := OrderedCollection new.
			array
				do: [ :each | 
					result addAll: each first.
					each size = 2
						ifTrue: [ result add: each second ] ].
			result ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> dataListItem [
	^ super dataListItem
		==> [ :array | 
			| item |
			item := array first withAll: (array second ifNil: [ {} ]).
			item addAll: array third.
			array fourth ifNotNil: [ :fourth | item addAll: (self listsParser parse: fourth) ].
			item ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> dataMarkup [
	^ super dataMarkup ==> [ :token | PRDataItem ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> dataSubListItem [
	^ super dataSubListItem
		==>
			[ :array | 
			| result |
			result := '' writeStream.
			array
				do: [ :elem | 
					elem isString
						ifTrue: [ result nextPutAll: elem ]
						ifFalse: [ result nextPutAll: elem second ] ].
			result contents ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> definitionList [
	^ super definitionList ==> [ :array | PRDefinitionList withAll: array ]
]

{ #category : #'grammar - Document' }
PRPillarParserOld >> document [
	"I build a PRDocument. I get a collection with all the children of the PRDocument and I dd them one by one."

	^ super document ==> [ :array | PRDocument withAll: array ]
]

{ #category : #'grammar - Paragraph' }
PRPillarParserOld >> emptyParagraph [
	^ super emptyParagraph ==> [ :array | PREmptyParagraph new ]
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> figure [
	^ super figure
		==>
			[ :array | 
			| fig |
			fig := PRFigure reference: array third.
			fig addAll: (array second ifNil: [ {} ]).
			fig parameters: (array fourth ifNil: [ OrderedDictionary new ]).
			fig ]
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> figureAlias [
	^ super figureAlias
		==>
			[ :string | 
			string
				ifEmpty: [ {(PRText content: '')} ]
				ifNotEmpty: [ self parse: string startingAt: #oneLineContent ] ]
]

{ #category : #'from markdown' }
PRPillarParserOld >> formatContent [
	^ super formatContent ==> [ :array | PRText content: (self stringFrom: array) ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> formatForArray: array [
	^ array first withAll: (array second collect: [ :each | each second ])
]

{ #category : #'grammar - Header' }
PRPillarParserOld >> header [
	"I create a PRHeader"

	^ super header ==> [ :array | 
		(PRHeader 
			withAll: (array second ifNil: [ {} ]) 
			level: array first size)
			start: array first start;
			stop: array first start + array first size + (array second ifNil: [ 0 ] ifNotNil: [ array second size ]) ]
]

{ #category : #'grammar - HorizontalRule' }
PRPillarParserOld >> horizontalRule [
	^ super horizontalRule ==> [ :array | PRHorizontalRule new ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> italicFormat [
	^ super italicFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> italicMarkup [
	^ super italicMarkup ==> [ :token | PRItalicFormat ]
]

{ #category : #'grammar - Document' }
PRPillarParserOld >> lineBreak [
	^ super lineBreak ==> [ :array | PRLineBreak new ]
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> link [
	^ super link
		==>
			[ :array | 
			| linkRes |
			linkRes := PRLink fromReference: array third.
			array second ifNotNil: [ :aliasChildren | linkRes addAll: aliasChildren ].
			linkRes parameters: (array fourth ifNil: [ OrderedDictionary new ]).
			linkRes ]
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> linkAlias [
	^ super linkAlias
		==>
			[ :string | 
			string
				ifEmpty: [ {(PRText content: '')} ]
				ifNotEmpty: [ self parse: string startingAt: #oneLineContent ] ]
]

{ #category : #helpers }
PRPillarParserOld >> listsParser [
	"We cache the lists parser to be faster"
	"Attention: we refer to PRPillarParser explicitely here instead of using ==self== so that the PRPillarCompiled parser, if it exists, can work."
	^ PRPillarParserOld newStartingAt: #lists
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> monospaceFormat [
	^ super monospaceFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> monospaceMarkup [
	^ super monospaceMarkup ==> [ :token | PRMonospaceFormat ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> orderedList [
	^ super orderedList ==> [ :array | PROrderedList withAll: array ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> orderedListItem [
	^ super orderedListItem
		==> [ :array | 
			| item |
			item := PRListItem withAll: (array second ifNil: [ {} ]).
			item addAll: array third.
			array fourth ifNotNil: [ :fourth | item addAll: (self listsParser parse: fourth) ].
			item ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> orderedSubListItem [
	^ super orderedSubListItem
		==>
			[ :array | 
			| result |
			result := '' writeStream.
			array
				do: [ :elem | 
					elem isString
						ifTrue: [ result nextPutAll: elem ]
						ifFalse: [ result nextPutAll: elem second ] ].
			result contents ]
]

{ #category : #'grammar - Paragraph' }
PRPillarParserOld >> paragraph [
	^ super paragraph ==> [ :array | PRParagraph withAll: array first]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterKeyUntilEndAnnotation [
	^ super parameterKeyUntilEndAnnotation ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterKeyUntilEndFigure [
	^ super parameterKeyUntilEndFigure ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterKeyUntilEndLink [
	^ super parameterKeyUntilEndLink ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterKeyUntilNewline [
	^ super parameterKeyUntilNewline ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterValueUntilEndAnnotation [
	^ super parameterValueUntilEndAnnotation ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterValueUntilEndFigure [
	^ super parameterValueUntilEndFigure ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterValueUntilEndLink [
	^ super parameterValueUntilEndLink ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parameterValueUntilNewline [
	^ super parameterValueUntilNewline ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParserOld >> parametersConvertToPharoObject: aString [
	"Convert if possible the aString argument into a Pharo object, we also replace nil by true"
	"We assume that aString represents only one possible value"

	| parsed |
	aString ifNil: [ ^ true ]. 
	"This is for the case where for example we have [[[foo, its value is nil and it should be true"
	parsed := (RBParser parseFaultyExpression: aString).

	^ parsed isLiteralNode 	
		ifTrue: [ parsed value]
		ifFalse: [ aString ]

	"^ [(Object readFrom: aString)
			ifNil: [ aString trimBoth ]
		ifNotNil: [ :e | e ]
		] on: Exception  do: [ :e | PRSyntaxError signal: aString, ' is not a valid value'
			aString ]"
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> parametersFigure [
	^ super parametersFigure ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Paragraph' }
PRPillarParserOld >> parametersFrom: array [
	| result |
	result := OrderedDictionary new.
	
	array first first
		ifNotEmpty:
			[ :string | 
			result at: string trimBoth put: (self parametersConvertToPharoObject: array first second).
			array second
				do:
					[ :each | each first ifNotEmpty: [ result at: each first trimBoth put: (self parametersConvertToPharoObject: each second) ] ] ].
	^ result
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> parametersLink [
	^ super parametersLink ==> [ :array | self parametersFrom: array ]
]

{ #category : #helpers }
PRPillarParserOld >> parse: anObject startingAt: aRule [
	^ (self class newStartingAt: aRule) parse: anObject
]

{ #category : #'grammar - Text' }
PRPillarParserOld >> preformatedLine [
	^ super preformatedLine ==> [ :array | PRText content: array second ]
]

{ #category : #'grammar - Text' }
PRPillarParserOld >> preformatedText [
	^ super preformatedText ==> [ :array | PRPreformatted withAll: array ]
]

{ #category : #'grammar - Raw' }
PRPillarParserOld >> raw [
	^ super raw
		==>
			[ :array | 
			| type contentRaw |
			contentRaw := '' writeStream.
			contentRaw nextPutAll: array third.
			PRRaw content: contentRaw contents type: array second ]
]

{ #category : #'from markdown' }
PRPillarParserOld >> referenceContent [
	^ super referenceContent ==> [ :array | PRText content: (self stringFrom: array) ]
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> referenceFigure [
	self flag: #todo. "We should maybe check for a :// inside the reference and maybe an extension."
	^ super referenceFigure ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Reference' }
PRPillarParserOld >> referenceLink [
	^ super referenceLink ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Script' }
PRPillarParserOld >> script [
	"I create a PRScript."

	^ super script ==> [ :array | PRCodeblock content: array third parameters: array second ]
]

{ #category : #'grammar - Script' }
PRPillarParserOld >> scriptParameters [
	^ super scriptParameters ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> strikethroughFormat [
	^ super strikethroughFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> strikethroughMarkup [
	^ super strikethroughMarkup ==> [ :token | PRStrikethroughFormat ]
]

{ #category : #helpers }
PRPillarParserOld >> stringFrom: characterArray [
	^ String streamContents: [ :stream | characterArray do: [ :character | stream nextPut: character ] ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> subscriptFormat [
	^ super subscriptFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> subscriptMarkup [
	^ super subscriptMarkup ==> [ :token | PRSubscriptFormat ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> superscriptFormat [
	^ super superscriptFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> superscriptMarkup [
	^ super superscriptMarkup ==> [ :token | PRSuperscriptFormat ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> table [
	^ super table ==> [ :array | PRTable withAll: array ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> tableCell [
	^ super tableCell
		==>
			[ :array | 
			PRTableCell
				align: array first first
				heading: array first second
				withAll:
					(array second trim
						ifEmpty: [ Array new ]
						ifNotEmpty:
							[ :string | self parse: string startingAt: #oneLineContent ]) ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> tableCenterMarkup [
	^ super tableCenterMarkup ==> [ :token | #center ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> tableHeadingMarkup [
	^ super tableHeadingMarkup ==> [ :token | true ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> tableLeftMarkup [
	^ super tableLeftMarkup ==> [ :token | #left ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> tableMarkups [
	^ super tableMarkups
		==> [ :array | 
			| result |
			result := Array ofSize: 2.
			result at: 2 put: (array second = true or: [ array third = true ]).
			result
				at: 1
				put:
					(array second isSymbol
						ifTrue: [ array second ]
						ifFalse: [ 
							array third isSymbol
								ifTrue: [ array third ] ]).
			result ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> tableRightMarkup [
	^ super tableRightMarkup ==> [ :token | #right ]
]

{ #category : #'grammar - Table' }
PRPillarParserOld >> tableRow [
	^ super tableRow
		==> [ :array | 
			| result |
			result := PRTableRow new.
			array first do: [ :cell | result add: cell ].
			result ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> termListItem [
	^ super termListItem
		==> [ :array | 
			| item |
			item := array first withAll: (array second ifNil: [ {} ]).
			item addAll: array third.
			array fourth ifNotNil: [ :fourth | item addAll: (self listsParser parse: fourth) ].
			item ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> termMarkup [
	^ super termMarkup ==> [ :token | PRTermItem ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> termSubListItem [
	^ super termSubListItem
		==>
			[ :array | 
			| result |
			result := '' writeStream.
			array
				do: [ :elem | 
					elem isString
						ifTrue: [ result nextPutAll: elem ]
						ifFalse: [ result nextPutAll: elem second ] ].
			result contents ]
]

{ #category : #'grammar - Text' }
PRPillarParserOld >> text [
	"A text is a PRText with a string that contains any character inside."

	^ super text
		==> [ :array | 
			| stream |
			stream := '' writeStream.
			array do: [ :letter | stream nextPut: letter ].
			PRText content: stream contents ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> underlineFormat [
	^ super underlineFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParserOld >> underlineMarkup [
	^ super underlineMarkup ==> [ :token | PRUnderlineFormat ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> unorderedList [
	^ super unorderedList ==> [ :array | PRUnorderedList withAll: array ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> unorderedListItem [
	^ super unorderedListItem
		==> [ :array | 
			| item |
			item := PRListItem withAll: (array second ifNil: [ {} ]).
			item addAll: array third.
			array fourth ifNotNil: [ :fourth | item addAll: (self listsParser parse: fourth) ].
			item ]
]

{ #category : #'grammar - List' }
PRPillarParserOld >> unorderedSubListItem [
	^ super unorderedSubListItem
		==>
			[ :array | 
			| result |
			result := '' writeStream.
			array
				do: [ :elem | 
					elem isString
						ifTrue: [ result nextPutAll: elem ]
						ifFalse: [ result nextPutAll: elem second ] ].
			result contents ]
]
