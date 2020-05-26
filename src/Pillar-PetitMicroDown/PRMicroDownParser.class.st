Class {
	#name : #PRMicroDownParser,
	#superclass : #PRMicroDownGrammar,
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #parsing }
PRMicroDownParser class >> parse: aStream [
	^ self new optimize parse: aStream
]

{ #category : #'grammar - Anchor' }
PRMicroDownParser >> anchor [
	"An anchor is just a line that begin with the character $@ and contains a text that we trim."

	^ super anchor ==> [ :array | PRAnchor named: array second ]
]

{ #category : #'grammar - Paragraph' }
PRMicroDownParser >> annotatedParagraph [
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
PRMicroDownParser >> annotation [
	^ super annotation ==> [ :array | 
			(array third withParameters: (array fourth ifNil: [ PRParameters new ]))
				start: array first start;
				stop: array sixth stop ]
]

{ #category : #'grammar - Annotation' }
PRMicroDownParser >> annotationParameters [
	^ super annotationParameters ==> [ :array | self parametersObjectFrom: array ]
]

{ #category : #'grammar - Annotation' }
PRMicroDownParser >> annotationTag [
	^ super annotationTag
		==> [ :array | | aTagName |
				aTagName := self stringFrom: array.
				PRAbstractAnnotation 
					findClassAcceptingTag: aTagName
					ifNone: [ PRValidation strategy missingAnnotationSupport: aTagName ] ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> boldFormat [
	^ super boldFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> boldMarkup [
	^ super boldMarkup ==> [ :token | PRBoldFormat ]
]

{ #category : #'grammar - Text' }
PRMicroDownParser >> commentedLine [
	^ super commentedLine ==> [ :array | 
		(PRCommentedLine content: array third)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - Document' }
PRMicroDownParser >> content [
	^ super content ==> [ :array | array second ifNil: [ {array first} ] ifNotNil: [ array ] ]
]

{ #category : #'grammar - Document' }
PRMicroDownParser >> contents [
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
PRMicroDownParser >> dataListItem [
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
PRMicroDownParser >> dataMarkup [
	^ super dataMarkup ==> [ :token | PRDataItem ]
]

{ #category : #'grammar - List' }
PRMicroDownParser >> dataSubListItem [
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
PRMicroDownParser >> definitionList [
	^ super definitionList ==> [ :array | 
			(PRDefinitionList withAll: array second)
				start: array first start;
				stop: array last stop ]
]

{ #category : #'grammar - Document' }
PRMicroDownParser >> document [
	"I build a PRDocument. I get a collection with all the children of the PRDocument and I dd them one by one."

	^ super document ==> [ :array | PRDocument withAll: array ]
]

{ #category : #'grammar - Paragraph' }
PRMicroDownParser >> emptyParagraph [
	^ super emptyParagraph ==> [ :array |
		PREmptyParagraph new start: array first start; stop: array third stop ]
]

{ #category : #'grammar - Reference' }
PRMicroDownParser >> figure [
	^ super figure ==> [ :array | 
			| fig |
			fig := PRFigure reference: array fourth.
			fig addAll: (array third ifNil: [ {} ]).
			fig parameters: (array fifth ifNil: [ OrderedDictionary new ]).
			fig start: array first start; stop: array last stop.
			fig ]
]

{ #category : #'grammar - Reference' }
PRMicroDownParser >> figureAlias [
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
PRMicroDownParser >> formatContent [
	^ super formatContent ==> [ :array | 
		(PRText content: (self stringFrom: array second))
			start: array first start;
			stop: array third stop ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> formatForArray: array [
	^ (array second withAll: (array third collect: [ :each | each second ]))
		start: array first start;
		stop: array last stop
]

{ #category : #'grammar - Header' }
PRMicroDownParser >> header [
	"I create a PRHeader"

	^ super header ==> [ :array | 
		(PRHeader 
			withAll: (array third ifNil: [ {} ]) 
			level: array second size)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - HorizontalRule' }
PRMicroDownParser >> horizontalRule [
	^ super horizontalRule ==> [ :array | PRHorizontalRule new ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> italicFormat [
	^ super italicFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> italicMarkup [
	^ super italicMarkup ==> [ :token | PRItalicFormat ]
]

{ #category : #'grammar - Document' }
PRMicroDownParser >> lineBreak [
	^ super lineBreak ==> [ :array | PRLineBreak new ]
]

{ #category : #'grammar - Reference' }
PRMicroDownParser >> link [
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
PRMicroDownParser >> linkAlias [
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
PRMicroDownParser >> listsParser [
	"We cache the lists parser to be faster"
	"Attention: we refer to PRPillarParser explicitely here instead of using ==self== so that the PRPillarCompiled parser, if it exists, can work."
	^ self 
		propertyAt: #listsParser 
		ifAbsentPut: [ (PRMicroDownParser newStartingAt: #lists) optimize ]
]

{ #category : #helpers }
PRMicroDownParser >> literalFrom: characterArray [
	^ PRMicroDownParserUtility convertToPharoObject: (self stringFrom: characterArray)
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> monospaceFormat [
	^ super monospaceFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> monospaceMarkup [
	^ super monospaceMarkup ==> [ :token | PRMonospaceFormat ]
]

{ #category : #'grammar - List' }
PRMicroDownParser >> orderedList [
	^ super orderedList ==> [ :array | 
			(PROrderedList withAll: array second)
				start: array first start;
				stop: array last stop ]
]

{ #category : #'grammar - List' }
PRMicroDownParser >> orderedListItem [
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
PRMicroDownParser >> orderedSubListItem [
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
PRMicroDownParser >> paragraph [
	^ super paragraph ==> [ :array | 
		(PRParagraph withAll: array second)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterFrom: array [
	^ (PRParameter 
			keyNode: array second 
			valueNode: (array third ifNil: [ PRMicroDownParserUtility newDefaultParameterValue ]))
		start: array first start;
		stop: array last stop
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterKeyFrom: array [
	^ (PRParameterKey named: (self stringFrom: array second))
		start: array first start;
		stop: array last stop
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterKeyUntilEndAnnotation [
	^ super parameterKeyUntilEndAnnotation ==> [ :array | self parameterKeyFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterKeyUntilEndFigure [
	^ super parameterKeyUntilEndFigure ==> [ :array | self stringFrom: array second ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterKeyUntilEndLink [
	^ super parameterKeyUntilEndLink ==> [ :array | self stringFrom: array second ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterKeyUntilNewline [
	^ super parameterKeyUntilNewline ==> [ :array | self stringFrom: array second ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterUntilEndAnnotation [
	^ super parameterUntilEndAnnotation ==>
			[ :array | self parameterFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterUntilNewline [
	^ super parameterUntilNewline "==>
			[ :array | self parameterFrom: array ]"
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterValueFrom: array [
	^ (PRParameterValue value: (self literalFrom: array third))
		start: array second start;
		stop: array last stop
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterValueUntilEndAnnotation [
	^ super parameterValueUntilEndAnnotation ==> [ :array | self parameterValueFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterValueUntilEndFigure [
	^ super parameterValueUntilEndFigure ==> [ :array | self stringFrom: array third ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterValueUntilEndLink [
	^ super parameterValueUntilEndLink ==> [ :array | self stringFrom: array third ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parameterValueUntilNewline [
	^ super parameterValueUntilNewline ==> [ :array | self stringFrom: array third ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parametersConvertToPharoObject: aString [
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
PRMicroDownParser >> parametersFigure [
	^ super parametersFigure ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parametersFrom: array [
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
PRMicroDownParser >> parametersLink [
	^ super parametersLink ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parametersObjectFrom: array [
	^ (PRParameters with: array fourth first withAll: array fourth second)
			start: array third start;
			stop: array fifth stop
]

{ #category : #'grammar - Parameter' }
PRMicroDownParser >> parametersUntilNewline [
	^ super parametersUntilNewline
]

{ #category : #helpers }
PRMicroDownParser >> parse: anObject startingAt: aRule [
	^ (self class newStartingAt: aRule) parse: anObject
]

{ #category : #'grammar - Text' }
PRMicroDownParser >> preformatedLine [
	^ super preformatedLine ==> [ :array | PRText content: array second ]
]

{ #category : #'grammar - Text' }
PRMicroDownParser >> preformatedText [
	^ super preformatedText ==> [ :array | PRPreformatted withAll: array ]
]

{ #category : #'grammar - Raw' }
PRMicroDownParser >> raw [
	^ super raw
		==>
			[ :array | 
			| contentRaw |
			contentRaw := '' writeStream.
			contentRaw nextPutAll: array third.
			PRRaw content: contentRaw contents type: array second ]
]

{ #category : #'from markdown' }
PRMicroDownParser >> referenceContent [
	^ super referenceContent ==> [ :array | PRText content: (self stringFrom: array) ]
]

{ #category : #'grammar - Reference' }
PRMicroDownParser >> referenceFigure [
	"Todo: We should maybe check for a :// inside the reference and maybe an extension."
	^ super referenceFigure ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Reference' }
PRMicroDownParser >> referenceLink [
	^ super referenceLink ==> [ :array | self stringFrom: array ]
]

{ #category : #'grammar - Script' }
PRMicroDownParser >> script [
	"I create a PRScript."

	^ super script ==> [ :array | 
		(PRCodeblock content: array fourth parameters: array third)
			start: array first start;
			stop: array last stop ]
]

{ #category : #'grammar - Script' }
PRMicroDownParser >> scriptParameters [
	^ super scriptParameters ==> [ :array | self parametersFrom: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> strikethroughFormat [
	^ super strikethroughFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> strikethroughMarkup [
	^ super strikethroughMarkup ==> [ :token | PRStrikethroughFormat ]
]

{ #category : #helpers }
PRMicroDownParser >> stringFrom: characterArray [
	^ String streamContents: [ :stream | characterArray do: [ :character | stream nextPut: character ] ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> subscriptFormat [
	^ super subscriptFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> subscriptMarkup [
	^ super subscriptMarkup ==> [ :token | PRSubscriptFormat ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> superscriptFormat [
	^ super superscriptFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> superscriptMarkup [
	^ super superscriptMarkup ==> [ :token | PRSuperscriptFormat ]
]

{ #category : #'grammar - Table' }
PRMicroDownParser >> table [
	^ super table ==> [ :array | PRTable withAll: array ]
]

{ #category : #'grammar - Table' }
PRMicroDownParser >> tableCell [
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
PRMicroDownParser >> tableCenterMarkup [
	^ super tableCenterMarkup ==> [ :token | #center ]
]

{ #category : #'grammar - Table' }
PRMicroDownParser >> tableHeadingMarkup [
	^ super tableHeadingMarkup ==> [ :token | true ]
]

{ #category : #'grammar - Table' }
PRMicroDownParser >> tableLeftMarkup [
	^ super tableLeftMarkup ==> [ :token | #left ]
]

{ #category : #'grammar - Table' }
PRMicroDownParser >> tableMarkups [
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
PRMicroDownParser >> tableRightMarkup [
	^ super tableRightMarkup ==> [ :token | #right ]
]

{ #category : #'grammar - Table' }
PRMicroDownParser >> tableRow [
	^ super tableRow
		==> [ :array | 
			| result |
			result := PRTableRow new.
			array first do: [ :cell | result add: cell ].
			result ]
]

{ #category : #'grammar - List' }
PRMicroDownParser >> termListItem [
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
PRMicroDownParser >> termMarkup [
	^ super termMarkup ==> [ :token | PRTermItem ]
]

{ #category : #'grammar - List' }
PRMicroDownParser >> termSubListItem [
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
PRMicroDownParser >> text [
	"A text is a PRText with a string that contains any character inside."

	^ super text ==> [ :array | 
			(PRText content: (self stringFrom: array second))
				start: array first start;
				stop: array third start - 1 ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> underlineFormat [
	^ super underlineFormat ==> [ :array | self formatForArray: array ]
]

{ #category : #'grammar - Format' }
PRMicroDownParser >> underlineMarkup [
	^ super underlineMarkup ==> [ :token | PRUnderlineFormat ]
]

{ #category : #'grammar - List' }
PRMicroDownParser >> unorderedList [
	^ super unorderedList ==> [ :array | 
			(PRUnorderedList withAll: array second)
				start: array first start;
				stop: array last stop ]
]

{ #category : #'grammar - List' }
PRMicroDownParser >> unorderedListItem [
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
PRMicroDownParser >> unorderedSubListItem [
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
