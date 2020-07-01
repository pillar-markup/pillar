"
I am a parser for a Pillar syntax. 
I use the PRPillarGrammar and I build a PRDocument.
"
Class {
	#name : #PRPillarParser,
	#superclass : #PRPillarGrammar,
	#category : #'Pillar-PetitPillar'
}

{ #category : #parsing }
PRPillarParser class >> parse: aStream [
	^ self new optimize parse: aStream
]

{ #category : #'grammar - Anchor' }
PRPillarParser >> anchor [
	"An anchor is just a line that begin with the character $@ and contains a text that we trim."

	^ super anchor ==> [ :array | PRAnchor named: array second ]
]

{ #category : #'grammar - Paragraph' }
PRPillarParser >> annotatedParagraph [
	^ super annotatedParagraph
		==> [ :array | 
				(PRAnnotatedParagraph 
					withAll: (array fourth
						ifNil: [ {} ] 
						ifNotNil: [ :elem | elem second ]) 
					annotation: array third)
						start: array first start;
						stop: array last stop ]
]

{ #category : #'grammar - Annotation' }
PRPillarParser >> annotation [
	^ super annotation ==> [ :array | 
			(array third withParameters: (array fourth ifNil: [ PRParameters new ]))
				start: array first start;
				stop: array sixth stop ]
]

{ #category : #'grammar - Annotation' }
PRPillarParser >> annotationParameters [
	^ super annotationParameters ==> [ :array | self parametersObjectFrom: array ]
]

{ #category : #'grammar - Annotation' }
PRPillarParser >> annotationTag [
	^ super annotationTag
		==> [ :array | | aTagName |
				aTagName := self stringFrom: array.
				PRAbstractAnnotation 
					findClassAcceptingTag: aTagName
					ifNone: [ PRValidation strategy missingAnnotationSupport: aTagName ] ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> boldFormat [
	^ super boldFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> boldMarkup [
	^ super boldMarkup ==> [ :token | PRBoldFormat ]
]

{ #category : #'grammar - Text' }
PRPillarParser >> commentedLine [
	^ super commentedLine ==> [ :array | 
		(PRCommentedLine content: array third)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - Document' }
PRPillarParser >> content [
	^ super content ==> [ :array | array second ifNil: [ {array first} ] ifNotNil: [ array ] ]
]

{ #category : #'grammar - Document' }
PRPillarParser >> contents [
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
PRPillarParser >> dataListItem [
	^ super dataListItem
		==> [ :array | 
			| item |
			item := array second withAll: (array third ifNil: [ {} ]).
			item addAll: array fourth.
			array fifth ifNotNil: [ :fifth | item addAll: (self listsParser parse: fifth) ].
			item
				start: array first start;
				stop: array last stop.
			item ]
]

{ #category : #'grammar - List' }
PRPillarParser >> dataMarkup [
	^ super dataMarkup ==> [ :token | PRDataItem ]
]

{ #category : #'grammar - List' }
PRPillarParser >> dataSubListItem [
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
PRPillarParser >> definitionList [
	^ super definitionList ==> [ :array | 
			(PRDefinitionList withAll: array second)
				start: array first start;
				stop: array last stop ]
]

{ #category : #'grammar - Document' }
PRPillarParser >> document [
	"I build a PRDocument. I get a collection with all the children of the PRDocument and I dd them one by one."

	^ super document ==> [ :array | PRDocument withAll: array ]
]

{ #category : #'grammar - Paragraph' }
PRPillarParser >> emptyParagraph [
	^ super emptyParagraph ==> [ :array |
		PREmptyParagraph new start: array first start; stop: array third stop ]
]

{ #category : #'grammar - Reference' }
PRPillarParser >> figure [
	^ super figure ==> [ :array | 
			| fig |
			fig := PRFigure reference: array fourth.
			fig addAll: (array third ifNil: [ {} ]).
			fig parameters: (array fifth ifNil: [ OrderedDictionary new ]).
			fig start: array first start; stop: array last stop.
			fig ]
]

{ #category : #'grammar - Reference' }
PRPillarParser >> figureAlias [
	^ super figureAlias ==> [ :anArray | 
			anArray second
				ifEmpty: [ { (PRText content: '') start: anArray first start; stop: anArray first start } ]
				ifNotEmpty: [ 
					| aCollection |
					aCollection := (self parse: anArray second startingAt: #oneLineContent).
					aCollection do: [ :each | 
						each start: each start + anArray first start - 1.
						each stop: each stop + anArray first start - 1 ] ] ]
]

{ #category : #'from markdown' }
PRPillarParser >> formatContent [
	^ super formatContent ==> [ :array | 
		(PRText content: (self stringFrom: array second))
			start: array first start;
			stop: array third stop ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> formatForArray: array [
	^ (array second withAll: (array third collect: [ :each | each second ]))
		start: array first start;
		stop: array last stop
]

{ #category : #'grammar - Header' }
PRPillarParser >> header [
	"I create a PRHeader"

	^ super header ==> [ :array | 
		(PRHeader 
			withAll: (array third ifNil: [ {} ]) 
			level: array second size)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - HorizontalRule' }
PRPillarParser >> horizontalRule [
	^ super horizontalRule ==> [ :array | PRHorizontalRule new ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> italicFormat [
	^ super italicFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> italicMarkup [
	^ super italicMarkup ==> [ :token | PRItalicFormat ]
]

{ #category : #'grammar - Document' }
PRPillarParser >> lineBreak [
	^ super lineBreak ==> [ :array | PRLineBreak new ]
]

{ #category : #'grammar - Reference' }
PRPillarParser >> link [
	^ super link
		==>
			[ :array | 
			| linkRes |
			linkRes := PRLink fromReference: array fourth.
			array third ifNotNil: [ :aliasChildren | linkRes addAll: aliasChildren ].
			linkRes parameters: (array fifth ifNil: [ OrderedDictionary new ]).
			linkRes start: array first start; stop: array last stop.
			linkRes ]
]

{ #category : #'grammar - Reference' }
PRPillarParser >> linkAlias [
	^ super linkAlias ==> [ :anArray | 
			anArray second
				ifEmpty: [ { (PRText content: '') start: anArray first start; stop: anArray first start } ]
				ifNotEmpty: [ 
					| aCollection |
					aCollection := (self parse: anArray second startingAt: #oneLineContent).
					aCollection do: [ :each | 
						each start: each start + anArray first start - 1.
						each stop: each stop + anArray first start - 1 ] ] ]
]

{ #category : #helpers }
PRPillarParser >> listsParser [
	"We cache the lists parser to be faster"
	"Attention: we refer to PRPillarParser explicitely here instead of using ==self== so that the PRPillarCompiled parser, if it exists, can work."
	^ self 
		propertyAt: #listsParser 
		ifAbsentPut: [ (PRPillarParser newStartingAt: #lists) optimize ]
]

{ #category : #helpers }
PRPillarParser >> literalFrom: characterArray [
	^ PRParserUtility convertToPharoObject: (self stringFrom: characterArray)
]

{ #category : #'grammar - Format' }
PRPillarParser >> monospaceFormat [
	^ super monospaceFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> monospaceMarkup [
	^ super monospaceMarkup ==> [ :token | PRMonospaceFormat ]
]

{ #category : #'grammar - List' }
PRPillarParser >> orderedList [
	^ super orderedList ==> [ :array | 
			(PROrderedList withAll: array second)
				start: array first start;
				stop: array last stop ]
]

{ #category : #'grammar - List' }
PRPillarParser >> orderedListItem [
	^ super orderedListItem
		==> [ :array | 
			| item |
			item := PRListItem withAll: (array third ifNil: [ {} ]).
			item addAll: array fourth.
			array fifth ifNotNil: [ :fifth | item addAll: (self listsParser parse: fifth) ].
			item
				start: array first start;
				stop: array last stop.
			item ]
]

{ #category : #'grammar - List' }
PRPillarParser >> orderedSubListItem [
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
PRPillarParser >> paragraph [
	^ super paragraph ==> [ :array | 
		(PRParagraph withAll: array second)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterFrom: array [
	^ (PRParameter 
			keyNode: array second 
			valueNode: (array third ifNil: [ PRParserUtility newDefaultParameterValue ]))
		start: array first start;
		stop: array last stop
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterKeyFrom: array [
	^ (PRParameterKey named: (self stringFrom: array second))
		start: array first start;
		stop: array last stop
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterKeyUntilEndAnnotation [
	^ super parameterKeyUntilEndAnnotation ==> [ :array | self parameterKeyFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterKeyUntilEndFigure [
	^ super parameterKeyUntilEndFigure ==> [ :array | self stringFrom: array second ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterKeyUntilEndLink [
	^ super parameterKeyUntilEndLink ==> [ :array | self stringFrom: array second ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterKeyUntilNewline [
	^ super parameterKeyUntilNewline ==> [ :array | self stringFrom: array second ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterUntilEndAnnotation [
	^ super parameterUntilEndAnnotation ==>
			[ :array | self parameterFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterValueFrom: array [
	^ (PRParameterValue value: (self literalFrom: array third))
		start: array second start;
		stop: array last stop
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterValueUntilEndAnnotation [
	^ super parameterValueUntilEndAnnotation ==> [ :array | self parameterValueFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterValueUntilEndFigure [
	^ super parameterValueUntilEndFigure ==> [ :array | self stringFrom: array third ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterValueUntilEndLink [
	^ super parameterValueUntilEndLink ==> [ :array | self stringFrom: array third ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parameterValueUntilNewline [
	^ super parameterValueUntilNewline ==> [ :array | self stringFrom: array third ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parametersConvertToPharoObject: aString [
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
PRPillarParser >> parametersFigure [
	^ super parametersFigure ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parametersFrom: array [
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
PRPillarParser >> parametersLink [
	^ super parametersLink ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRPillarParser >> parametersObjectFrom: array [
	^ (PRParameters with: array fourth first withAll: array fourth second)
			start: array third start;
			stop: array fifth stop
]

{ #category : #helpers }
PRPillarParser >> parse: anObject startingAt: aRule [
	^ (self class newStartingAt: aRule) parse: anObject
]

{ #category : #'grammar - Text' }
PRPillarParser >> preformatedLine [
	^ super preformatedLine ==> [ :array | PRText content: array second ]
]

{ #category : #'grammar - Text' }
PRPillarParser >> preformatedText [
	^ super preformatedText ==> [ :array | PRPreformatted withAll: array ]
]

{ #category : #'grammar - Raw' }
PRPillarParser >> raw [
	^ super raw
		==>
			[ :array | 
			| contentRaw |
			contentRaw := '' writeStream.
			contentRaw nextPutAll: array third.
			PRRaw content: contentRaw contents type: array second ]
]

{ #category : #'from markdown' }
PRPillarParser >> referenceContent [
	^ super referenceContent ==> [ :array | PRText content: (self stringFrom: array) ]
]

{ #category : #'grammar - Reference' }
PRPillarParser >> referenceFigure [
	"Todo: We should maybe check for a :// inside the reference and maybe an extension."
	^ super referenceFigure ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Reference' }
PRPillarParser >> referenceLink [
	^ super referenceLink ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Script' }
PRPillarParser >> script [
	"I create a PRScript."

	^ super script ==> [ :array | 
		(PRCodeblock content: array fourth parameters: array third)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - Script' }
PRPillarParser >> scriptParameters [
	^ super scriptParameters ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> strikethroughFormat [
	^ super strikethroughFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> strikethroughMarkup [
	^ super strikethroughMarkup ==> [ :token | PRStrikethroughFormat ]
]

{ #category : #helpers }
PRPillarParser >> stringFrom: characterArray [
	^ String streamContents: [ :stream | characterArray do: [ :character | stream nextPut: character ] ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> subscriptFormat [
	^ super subscriptFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> subscriptMarkup [
	^ super subscriptMarkup ==> [ :token | PRSubscriptFormat ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> superscriptFormat [
	^ super superscriptFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> superscriptMarkup [
	^ super superscriptMarkup ==> [ :token | PRSuperscriptFormat ]
]

{ #category : #'grammar - Table' }
PRPillarParser >> table [
	^ super table ==> [ :array | PRTable withAll: array ]
]

{ #category : #'grammar - Table' }
PRPillarParser >> tableCell [
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
PRPillarParser >> tableCenterMarkup [
	^ super tableCenterMarkup ==> [ :token | #center ]
]

{ #category : #'grammar - Table' }
PRPillarParser >> tableHeadingMarkup [
	^ super tableHeadingMarkup ==> [ :token | true ]
]

{ #category : #'grammar - Table' }
PRPillarParser >> tableLeftMarkup [
	^ super tableLeftMarkup ==> [ :token | #left ]
]

{ #category : #'grammar - Table' }
PRPillarParser >> tableMarkups [
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
PRPillarParser >> tableRightMarkup [
	^ super tableRightMarkup ==> [ :token | #right ]
]

{ #category : #'grammar - Table' }
PRPillarParser >> tableRow [
	^ super tableRow
		==> [ :array | 
			| result |
			result := PRTableRow new.
			array first do: [ :cell | result add: cell ].
			result ]
]

{ #category : #'grammar - List' }
PRPillarParser >> termListItem [
	^ super termListItem
		==> [ :array | 
			| item |
			item := array second withAll: (array third ifNil: [ {} ]).
			item addAll: array fourth.
			array fifth ifNotNil: [ :fifth | item addAll: (self listsParser parse: fifth) ].
			item
				start: array first start;
				stop: array last stop.
			item ]
]

{ #category : #'grammar - List' }
PRPillarParser >> termMarkup [
	^ super termMarkup ==> [ :token | PRTermItem ]
]

{ #category : #'grammar - List' }
PRPillarParser >> termSubListItem [
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
PRPillarParser >> text [
	"A text is a PRText with a string that contains any character inside."

	^ super text ==> [ :array | 
			(PRText content: (self stringFrom: array second))
				start: array first start;
				stop: array third start - 1 ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> underlineFormat [
	^ super underlineFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRPillarParser >> underlineMarkup [
	^ super underlineMarkup ==> [ :token | PRUnderlineFormat ]
]

{ #category : #'grammar - List' }
PRPillarParser >> unorderedList [
	^ super unorderedList ==> [ :array | 
			(PRUnorderedList withAll: array second)
				start: array first start;
				stop: array last stop ]
]

{ #category : #'grammar - List' }
PRPillarParser >> unorderedListItem [
	^ super unorderedListItem
		==> [ :array | 
			| item |
			item := PRListItem withAll: (array third ifNil: [ {} ]).
			item addAll: array fourth.
			array fifth ifNotNil: [ :fifth | item addAll: (self listsParser parse: fifth) ].
			item
				start: array first start;
				stop: array last stop.
			item ]
]

{ #category : #'grammar - List' }
PRPillarParser >> unorderedSubListItem [
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
