"
I am a grammar to parse Pillar files with PetitParser.
"
Class {
	#name : #PRPillarGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'document',
		'newline',
		'lineEnd',
		'elementsAtLineBeginning',
		'paragraph',
		'content',
		'text',
		'otherContent',
		'escapedCharacter',
		'lineBreak',
		'contents',
		'commentedLine',
		'annotation',
		'format',
		'header',
		'elementWithNewline',
		'emptyParagraph',
		'oneLineContent',
		'anchor',
		'preformatedText',
		'preformatedLine',
		'horizontalRule',
		'annotatedParagraph',
		'list',
		'unorderedList',
		'orderedList',
		'definitionList',
		'listMarkup',
		'subList',
		'lists',
		'table',
		'tableRow',
		'tableMarkups',
		'tableAlignMarkup',
		'tableHeadingMarkup',
		'tableCell',
		'tableCenterMarkup',
		'tableLeftMarkup',
		'tableRightMarkup',
		'script',
		'reference',
		'link',
		'figure',
		'raw',
		'orderedListItem',
		'unorderedListItem',
		'termListItem',
		'dataListItem',
		'dataBasicListItem',
		'orderedBasicListItem',
		'termBasicListItem',
		'unorderedBasicListItem',
		'dataSubListItem',
		'orderedSubListItem',
		'termSubListItem',
		'unorderedSubListItem',
		'monospaceFormat',
		'boldFormat',
		'italicFormat',
		'underlineFormat',
		'strikethroughFormat',
		'subscriptFormat',
		'superscriptFormat',
		'boldMarkup',
		'monospaceMarkup',
		'italicMarkup',
		'strikethroughMarkup',
		'subscriptMarkup',
		'superscriptMarkup',
		'underlineMarkup',
		'annotationEndMarkup',
		'dataMarkup',
		'orderedMarkup',
		'termMarkup',
		'unorderedMarkup',
		'rawEndMarkup',
		'figureMarkup',
		'linkMarkup',
		'scriptParameters',
		'parameterMarkup',
		'parameterValueMarkup',
		'space',
		'referenceAliasMarkup',
		'formatContent',
		'figureReference',
		'parametersUntilNewline',
		'parameterUntilNewline',
		'parameterValueUntilNewline',
		'parameterKeyUntilNewline',
		'parametersUntilEndAnnotation',
		'parameterUntilEndAnnotation',
		'annotationMarkupSeparator',
		'parameterKeyUntilEndAnnotation',
		'parameterValueUntilEndAnnotation',
		'annotationTag',
		'annotationParameters',
		'referenceFigure',
		'parametersFigure',
		'parametersUntilEndFigure',
		'parameterUntilEndFigure',
		'parameterKeyUntilEndFigure',
		'parameterValueUntilEndFigure',
		'referenceLink',
		'parameterKeyUntilEndLink',
		'parameterValueUntilEndLink',
		'parameterUntilEndLink',
		'parametersUntilEndLink',
		'parametersLink',
		'rawTypeMarkup',
		'rawType',
		'specialReferenceMarkups',
		'specialFormatMarkups',
		'referenceContent',
		'linkAlias',
		'figureAlias'
	],
	#classVars : [
		'EndMarkups',
		'Markups'
	],
	#category : 'Pillar-PetitPillar'
}

{ #category : #accessing }
PRPillarGrammar class >> defaultEndMarkups [
	| markups |
	markups := Dictionary new.
	markups
		at: PRAbstractAnnotation put: '}$';
		at: PRRaw put: '}}}';
		at: PRCodeblock put: ']]]'.
	^ markups
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupAnnotationSeparator [
	^ $:
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupParameter [
	^ '|'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupParameterValue [
	^ '='
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupRawType [
	^ ':'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupReferenceAlias [
	^ '>'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupReferenceAnchor [
	^ '@'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupTableCenter [
	^ '|'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupTableHeader [
	^ '!'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupTableLeft [
	^ '{'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkupTableRight [
	^ '}'
]

{ #category : #accessing }
PRPillarGrammar class >> defaultMarkups [
	^ self textMarkups , self lineMarkups
]

{ #category : #accessing }
PRPillarGrammar class >> endMarkups [
	^ EndMarkups
]

{ #category : #accessing }
PRPillarGrammar class >> endMarkups: anObject [
	EndMarkups := anObject
]

{ #category : #'class initialization' }
PRPillarGrammar class >> initialize [
	Markups := self defaultMarkups.
	EndMarkups := self defaultEndMarkups.
]

{ #category : #accessing }
PRPillarGrammar class >> lineMarkups [
	| markups |
	markups := Dictionary new.
	markups
		at: PRAnchor put: '@';
		at: PRHeader put: '!';
		at: PROrderedList put: '#';
		at: PRUnorderedList put: '-';
		at: PRDataItem put: ':';
		at: PRTermItem put: ';';
		at: PRAnnotatedParagraph put: '@@';
		at: PRPreformatted put: '= ';
		at: PRHorizontalRule put: '_';
		at: PRCommentedLine put: '%';
		at: PRTableCell put: '|'.
	^ markups
]

{ #category : #accessing }
PRPillarGrammar class >> markups [
	^ Markups
]

{ #category : #accessing }
PRPillarGrammar class >> markups: anObject [
	Markups := anObject
]

{ #category : #accessing }
PRPillarGrammar class >> textMarkups [
	| markups |
	markups := Dictionary new.
	markups
		at: PRBoldFormat put: '""';
		at: PRItalicFormat put: '''''';
		at: PRMonospaceFormat put: '==';
		at: PRStrikethroughFormat put: '--';
		at: PRSubscriptFormat put: '@@';
		at: PRSuperscriptFormat put: '^^';
		at: PRUnderlineFormat put: '__';
		at: PRFigure put: '+';
		at: PRLink put: '*';
		at: PRCodeblock put: '[[[';
		at: PRRaw put: '{{{';
		at: PRAbstractAnnotation put: '${'.
	^ markups
]

{ #category : #'grammar - Anchor' }
PRPillarGrammar >> anchor [
	^ (Markups at: PRAnchor) asParser , lineEnd negate plus flatten
]

{ #category : #'grammar - Paragraph' }
PRPillarGrammar >> annotatedParagraph [
	^ (Markups at: PRAnnotatedParagraph) asParser , ($  asParser / newline) negate star flatten , ($  asParser , oneLineContent) optional
]

{ #category : #'grammar - Annotation' }
PRPillarGrammar >> annotation [
	self flag: #todo.	"An annotation should have the possibility to be outside of a paragraph."
	^ (Markups at: PRAbstractAnnotation) asParser , annotationTag , annotationParameters optional
		, annotationEndMarkup , #blank asParser star
]

{ #category : #'grammar - Annotation' }
PRPillarGrammar >> annotationEndMarkup [
	^ (EndMarkups at: PRAbstractAnnotation) asParser
]

{ #category : #'grammar - Annotation' }
PRPillarGrammar >> annotationMarkupSeparator [
	^ self class defaultMarkupAnnotationSeparator asParser
]

{ #category : #'grammar - Annotation' }
PRPillarGrammar >> annotationParameters [
	^ (annotationMarkupSeparator , parametersUntilEndAnnotation) ==> [ :array | array second ]
]

{ #category : #'grammar - Annotation' }
PRPillarGrammar >> annotationTag [
	^ (escapedCharacter / annotationMarkupSeparator / annotationEndMarkup) negate plus
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> boldFormat [
	^ self formatFor: boldMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> boldMarkup [
	^ (Markups at: PRBoldFormat) asParser
]

{ #category : #'grammar - Text' }
PRPillarGrammar >> commentedLine [
	^ (Markups at: PRCommentedLine) asParser , lineEnd negate star flatten
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> content [
	^ oneLineContent , lineBreak optional
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> contents [
	^ content plus
]

{ #category : #'grammar - List' }
PRPillarGrammar >> dataBasicListItem [
	^ (dataMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammar >> dataListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ dataMarkup and , dataBasicListItem optional , ((commentedLine , newline) ==> [ :array | array first ]) star , dataSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammar >> dataMarkup [
	^ (Markups at: PRDataItem) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammar >> dataSubListItem [
	^ ((dataMarkup , subList) / (commentedLine , newline) flatten) plus
]

{ #category : #'grammar - List' }
PRPillarGrammar >> definitionList [
	^ (termListItem / dataListItem) plus
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> document [
	"A document contain everything that can be at the top of a document. It can contain for example some headers, paragraph, tables etc."

	^ (elementsAtLineBeginning / paragraph) star
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> elementWithNewline [
	^ (header / annotatedParagraph / anchor / commentedLine / horizontalRule , lineEnd) ==> #first
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> elementsAtLineBeginning [
	^  elementWithNewline / list / script / table / commentedLine / preformatedText / emptyParagraph
]

{ #category : #'grammar - Paragraph' }
PRPillarGrammar >> emptyParagraph [
	^ newline
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> escapedCharacter [
	^ ($\ asParser , #any asParser) ==> #second
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> figure [
	^ figureMarkup , figureAlias optional , referenceFigure , parametersFigure optional , figureMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> figureAlias [
	^ ((escapedCharacter / (figureMarkup / referenceAliasMarkup) negate) star flatten, referenceAliasMarkup) ==> #first
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> figureMarkup [
	^ (Markups at: PRFigure) asParser
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> figureReference [
	^ (figureMarkup / parameterMarkup) negate plus flatten
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> format [
	self flag: 'Now a format can be empty (use of star instead of plus in these parsers). Do we really want this ? Some unit tests specify that a format can be empty but we can remove them'.
	^ monospaceFormat / boldFormat / italicFormat / underlineFormat / strikethroughFormat / subscriptFormat / superscriptFormat
]

{ #category : #'from markdown' }
PRPillarGrammar >> formatContent [
	^ (escapedCharacter / specialFormatMarkups negate) plus
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> formatFor: aMarkupParser [
	^ aMarkupParser , (aMarkupParser not , ( otherContent / formatContent)) star , aMarkupParser
]

{ #category : #'grammar - Header' }
PRPillarGrammar >> header [
	"A header begin by a certain amount of $! and contains a text and/or some formatedText"

	^ (Markups at: PRHeader) asParser plus token , oneLineContent optional trimBlanks
]

{ #category : #'grammar - HorizontalRule' }
PRPillarGrammar >> horizontalRule [
	^ (Markups at: PRHorizontalRule) asParser , #blank asParser star
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> italicFormat [
	^ self formatFor: italicMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> italicMarkup [
	^ (Markups at: PRItalicFormat) asParser
]

{ #category : #'grammar - Text' }
PRPillarGrammar >> lineBreak [
	^ newline , elementsAtLineBeginning not
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> lineEnd [
	^ newline / #eof asParser
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> link [
	^ linkMarkup , linkAlias optional , referenceLink , parametersLink optional , linkMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> linkAlias [
	^ ((escapedCharacter / (linkMarkup / referenceAliasMarkup) negate) star flatten, referenceAliasMarkup) ==> #first
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> linkMarkup [
	^ (Markups at: PRLink) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammar >> list [
	self flag: #todo.	"The list elements should be trim."
	^ (unorderedList / orderedList / definitionList) memoized
]

{ #category : #'grammar - List' }
PRPillarGrammar >> listMarkup [
	^ orderedMarkup / unorderedMarkup / termMarkup / dataMarkup
]

{ #category : #'grammar - List' }
PRPillarGrammar >> lists [
	^ list plus
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> monospaceFormat [
	^ self formatFor: monospaceMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> monospaceMarkup [
	^ (Markups at: PRMonospaceFormat) asParser
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> newline [
	^ String crlf asParser / String lf asParser / String cr asParser
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> oneLineContent [
	^ (otherContent / text) plus
]

{ #category : #'grammar - List' }
PRPillarGrammar >> orderedBasicListItem [
	^ (orderedMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammar >> orderedList [
	^ orderedListItem plus
]

{ #category : #'grammar - List' }
PRPillarGrammar >> orderedListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ orderedMarkup and , orderedBasicListItem optional , ((commentedLine , newline) ==> [ :array | array first ]) star , orderedSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammar >> orderedMarkup [
	^ (Markups at: PROrderedList) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammar >> orderedSubListItem [
	^ ((orderedMarkup , subList) / (commentedLine , newline) flatten) plus
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> otherContent [
	^ format / annotation / reference / raw
]

{ #category : #'grammar - Paragraph' }
PRPillarGrammar >> paragraph [
	^ contents , lineEnd
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterKeyUntilEndAnnotation [
	^ self parameterKeyUntilParser: annotationEndMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterKeyUntilEndFigure [
	^ self parameterKeyUntilParser: figureMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterKeyUntilEndLink [
	^ self parameterKeyUntilParser: linkMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterKeyUntilNewline [
	^ self parameterKeyUntilParser: newline
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterKeyUntilParser: aParser [
	^ (escapedCharacter / (aParser / parameterMarkup / parameterValueMarkup) negate) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterMarkup [
	^ self class defaultMarkupParameter asParser
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterUntilEndAnnotation [
	^ parameterKeyUntilEndAnnotation , parameterValueUntilEndAnnotation optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterUntilEndFigure [
	^ parameterKeyUntilEndFigure , parameterValueUntilEndFigure optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterUntilEndLink [
	^ parameterKeyUntilEndLink , parameterValueUntilEndLink optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterUntilNewline [
	^ parameterKeyUntilNewline , parameterValueUntilNewline optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterValue [
	^ (figureMarkup / parameterMarkup) negate star flatten
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterValueMarkup [
	^ self class defaultMarkupParameterValue asParser
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterValueUntilEndAnnotation [
	^ self parameterValueUntilParser: annotationEndMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterValueUntilEndFigure [
	^ self parameterValueUntilParser: figureMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterValueUntilEndLink [
	^ self parameterValueUntilParser: linkMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterValueUntilNewline [
	^ self parameterValueUntilParser: newline
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parameterValueUntilParser: aParser [
	^ (parameterValueMarkup , (escapedCharacter / (aParser / parameterMarkup) negate) star) ==> [ :array | array second ]
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> parametersFigure [
	^ (parameterMarkup , parametersUntilEndFigure) ==> [ :array | array second ]
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> parametersLink [
	^ (parameterMarkup , parametersUntilEndLink) ==> #second
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parametersUntilEndAnnotation [
	^ parameterUntilEndAnnotation , ((parameterMarkup , parameterUntilEndAnnotation) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parametersUntilEndFigure [
	^ parameterUntilEndFigure
		, ((parameterMarkup , parameterUntilEndFigure) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parametersUntilEndLink [
	^ parameterUntilEndLink
		, ((parameterMarkup , parameterUntilEndLink) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammar >> parametersUntilNewline [
	^ parameterUntilNewline , ((parameterMarkup , parameterUntilNewline) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Text' }
PRPillarGrammar >> preformatedLine [
	^ (Markups at: PRPreformatted) asParser , lineEnd negate star flatten , lineEnd
]

{ #category : #'grammar - Text' }
PRPillarGrammar >> preformatedText [
	^ preformatedLine plus
]

{ #category : #'grammar - Raw' }
PRPillarGrammar >> raw [
	^ (Markups at: PRRaw) asParser , rawType optional
		, rawEndMarkup negate star flatten , rawEndMarkup
]

{ #category : #'grammar - Raw' }
PRPillarGrammar >> rawEndMarkup [
	^ (EndMarkups at: PRRaw) asParser
]

{ #category : #'grammar - Raw' }
PRPillarGrammar >> rawType [
	^ (rawEndMarkup / rawTypeMarkup) negate plus flatten , rawTypeMarkup ==> [ :array | array first ] 
]

{ #category : #'grammar - Raw' }
PRPillarGrammar >> rawTypeMarkup [
	^ self class defaultMarkupRawType asParser
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> reference [
	^ link / figure
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> referenceAliasMarkup [
	^ self class defaultMarkupReferenceAlias asParser
]

{ #category : #'from markdown' }
PRPillarGrammar >> referenceContent [
	^ (escapedCharacter / specialReferenceMarkups negate) plus
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> referenceFigure [
	^ self referenceUntil: figureMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> referenceLink [
	^ self referenceUntil: linkMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammar >> referenceUntil: aParser [
	^ (escapedCharacter / (aParser / parameterMarkup / newline) negate) plus
]

{ #category : #'grammar - Script' }
PRPillarGrammar >> script [
	| endParser |
	endParser := newline asParser , (EndMarkups at: PRCodeblock) asParser , space star , lineEnd.
	^ (Markups at: PRCodeblock) asParser , scriptParameters , endParser negate plus flatten , endParser
]

{ #category : #'grammar - Script' }
PRPillarGrammar >> scriptParameters [
	^ parametersUntilNewline , newline ==> [ :array | array first ]
]

{ #category : #'from markdown' }
PRPillarGrammar >> space [
	^ #blank asParser
]

{ #category : #'from markdown' }
PRPillarGrammar >> specialFormatMarkups [
	^ boldMarkup  / italicMarkup / monospaceMarkup / strikethroughMarkup / subscriptMarkup / superscriptMarkup / underlineMarkup
]

{ #category : #'from markdown' }
PRPillarGrammar >> specialReferenceMarkups [
	^ referenceAliasMarkup / linkMarkup / figureMarkup
]

{ #category : #'grammar - Document' }
PRPillarGrammar >> start [
	^ document end
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> strikethroughFormat [
	^ self formatFor: strikethroughMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> strikethroughMarkup [
	^ (Markups at: PRStrikethroughFormat) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammar >> subList [
	^ (listMarkup plus , oneLineContent optional , lineEnd) flatten
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> subscriptFormat [
	^ self formatFor: subscriptMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> subscriptMarkup [
	^ (Markups at: PRSubscriptFormat) asParser
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> superscriptFormat [
	^ self formatFor: superscriptMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> superscriptMarkup [
	^ (Markups at: PRSuperscriptFormat) asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> table [
	self flag: #todo. "Add the possibility to have comment inside a table. See PRPillarGrammarTest>>testTableWithComment."
	^ tableRow plus
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableAlignMarkup [
	^ tableCenterMarkup / tableLeftMarkup / tableRightMarkup
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableCell [
	| cellSeparator |
	cellSeparator := (Markups at: PRTableCell) asParser.
	^ tableMarkups , (escapedCharacter / (cellSeparator / lineEnd) negate) star flatten
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableCenterMarkup [
	^ self class defaultMarkupTableCenter asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableHeadingMarkup [
	^ self class defaultMarkupTableHeader asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableLeftMarkup [
	^ self class defaultMarkupTableLeft asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableMarkups [
	| optionalParser |
	self flag: #todo.	"In the future we will define the alignement before the headind."
	optionalParser := (tableAlignMarkup / tableHeadingMarkup) optional.
	^ (Markups at: PRTableCell) asParser , optionalParser , optionalParser
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableRightMarkup [
	^ self class defaultMarkupTableRight asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammar >> tableRow [
	^ tableCell plus , lineEnd
]

{ #category : #'grammar - List' }
PRPillarGrammar >> termBasicListItem [
	^ (termMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammar >> termListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ termMarkup and , termBasicListItem optional , ((commentedLine , newline) ==> [ :array | array first ]) star , termSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammar >> termMarkup [
	^ (Markups at: PRTermItem) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammar >> termSubListItem [
	^ ((termMarkup , subList) / (commentedLine , newline) flatten) plus
]

{ #category : #'grammar - Text' }
PRPillarGrammar >> text [
	"Everything that is a pure text and nothing else (not a format, not a link, ...)"
	^  (escapedCharacter / ((newline , elementsAtLineBeginning) / otherContent / lineEnd) negate) plus
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> underlineFormat [
	^ self formatFor: underlineMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammar >> underlineMarkup [
	^ (Markups at: PRUnderlineFormat) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammar >> unorderedBasicListItem [
	^ (unorderedMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammar >> unorderedList [
	^ unorderedListItem plus
]

{ #category : #'grammar - List' }
PRPillarGrammar >> unorderedListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ unorderedMarkup and , unorderedBasicListItem optional , ((commentedLine , newline) ==> [ :array | array first ]) star , unorderedSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammar >> unorderedMarkup [
	^ (Markups at: PRUnorderedList) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammar >> unorderedSubListItem [
	^ ((unorderedMarkup , subList) / (commentedLine , newline) flatten) plus
]
