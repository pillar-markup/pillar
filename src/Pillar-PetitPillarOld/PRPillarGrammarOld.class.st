"
I am a grammar to parse Pillar files with PetitParser.
"
Class {
	#name : #PRPillarGrammarOld,
	#superclass : #PPCompositeParser,
	#instVars : [
		'document',
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
	#category : #'Pillar-PetitPillarOld'
}

{ #category : #accessing }
PRPillarGrammarOld class >> defaultEndMarkups [
	| markups |
	markups := Dictionary new.
	markups
		at: PRAbstractAnnotation put: '}$';
		at: PRRaw put: '}}}';
		at: PRCodeblock put: ']]]'.
	^ markups
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupAnnotationSeparator [
	^ $:
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupParameter [
	^ '|'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupParameterValue [
	^ '='
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupRawType [
	^ ':'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupReferenceAlias [
	^ '>'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupReferenceAnchor [
	^ '@'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupTableCenter [
	^ '|'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupTableHeader [
	^ '!'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupTableLeft [
	^ '{'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkupTableRight [
	^ '}'
]

{ #category : #accessing }
PRPillarGrammarOld class >> defaultMarkups [
	^ self textMarkups , self lineMarkups
]

{ #category : #accessing }
PRPillarGrammarOld class >> endMarkups [
	^ EndMarkups
]

{ #category : #accessing }
PRPillarGrammarOld class >> endMarkups: anObject [
	EndMarkups := anObject
]

{ #category : #'class initialization' }
PRPillarGrammarOld class >> initialize [
	Markups := self defaultMarkups.
	EndMarkups := self defaultEndMarkups.
]

{ #category : #accessing }
PRPillarGrammarOld class >> lineMarkups [
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
PRPillarGrammarOld class >> markups [
	^ Markups
]

{ #category : #accessing }
PRPillarGrammarOld class >> markups: anObject [
	Markups := anObject
]

{ #category : #accessing }
PRPillarGrammarOld class >> textMarkups [
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
PRPillarGrammarOld >> anchor [
	^ (Markups at: PRAnchor) asParser , lineEnd negate plus flatten
]

{ #category : #'grammar - Paragraph' }
PRPillarGrammarOld >> annotatedParagraph [
	^ (Markups at: PRAnnotatedParagraph) asParser , ($  asParser / #newline asParser) negate star flatten , ($  asParser , oneLineContent) optional
]

{ #category : #'grammar - Annotation' }
PRPillarGrammarOld >> annotation [
	self flag: #todo.	"An annotation should have the possibility to be outside of a paragraph."
	^ (Markups at: PRAbstractAnnotation) asParser , annotationTag , annotationParameters optional
		, annotationEndMarkup , #blank asParser star
]

{ #category : #'grammar - Annotation' }
PRPillarGrammarOld >> annotationEndMarkup [
	^ (EndMarkups at: PRAbstractAnnotation) asParser
]

{ #category : #'grammar - Annotation' }
PRPillarGrammarOld >> annotationMarkupSeparator [
	^ self class defaultMarkupAnnotationSeparator asParser
]

{ #category : #'grammar - Annotation' }
PRPillarGrammarOld >> annotationParameters [
	^ (annotationMarkupSeparator , parametersUntilEndAnnotation) ==> [ :array | array second ]
]

{ #category : #'grammar - Annotation' }
PRPillarGrammarOld >> annotationTag [
	^ (escapedCharacter / annotationMarkupSeparator / annotationEndMarkup) negate plus
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> boldFormat [
	^ self formatFor: boldMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> boldMarkup [
	^ (Markups at: PRBoldFormat) asParser
]

{ #category : #'grammar - Text' }
PRPillarGrammarOld >> commentedLine [
	^ (Markups at: PRCommentedLine) asParser , lineEnd negate star flatten
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> content [
	^ oneLineContent , lineBreak optional
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> contents [
	^ content plus
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> dataBasicListItem [
	^ (dataMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> dataListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ dataMarkup and , dataBasicListItem optional , ((commentedLine , #newline asParser) ==> [ :array | array first ]) star , dataSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> dataMarkup [
	^ (Markups at: PRDataItem) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> dataSubListItem [
	^ ((dataMarkup , subList) / (commentedLine , #newline asParser) flatten) plus
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> definitionList [
	^ (termListItem / dataListItem) plus
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> document [
	"A document contain everything that can be at the top of a document. It can contain for example some headers, paragraph, tables etc."

	^ (elementsAtLineBeginning / paragraph) star
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> elementWithNewline [
	^ (header / annotatedParagraph / anchor / commentedLine / horizontalRule , lineEnd) ==> #first
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> elementsAtLineBeginning [
	^  elementWithNewline / list / script / table / commentedLine / preformatedText / emptyParagraph
]

{ #category : #'grammar - Paragraph' }
PRPillarGrammarOld >> emptyParagraph [
	^ #newline asParser
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> escapedCharacter [
	^ ($\ asParser , #any asParser) ==> #second
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> figure [
	^ figureMarkup , figureAlias optional , referenceFigure , parametersFigure optional , figureMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> figureAlias [
	^ ((escapedCharacter / (figureMarkup / referenceAliasMarkup) negate) star flatten, referenceAliasMarkup) ==> #first
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> figureMarkup [
	^ (Markups at: PRFigure) asParser
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> figureReference [
	^ (figureMarkup / parameterMarkup) negate plus flatten
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> format [
	self flag: 'Now a format can be empty (use of star instead of plus in these parsers). Do we really want this ? Some unit tests specify that a format can be empty but we can remove them'.
	^ monospaceFormat / boldFormat / italicFormat / underlineFormat / strikethroughFormat / subscriptFormat / superscriptFormat
]

{ #category : #'from markdown' }
PRPillarGrammarOld >> formatContent [
	^ (escapedCharacter / specialFormatMarkups negate) plus
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> formatFor: aMarkupParser [
	^ aMarkupParser , (aMarkupParser not , ( otherContent / formatContent)) star , aMarkupParser
]

{ #category : #'grammar - Header' }
PRPillarGrammarOld >> header [
	"A header begin by a certain amount of $! and contains a text and/or some formatedText"

	^ (Markups at: PRHeader) asParser plus token , oneLineContent optional trimBlanks
]

{ #category : #'grammar - HorizontalRule' }
PRPillarGrammarOld >> horizontalRule [
	^ (Markups at: PRHorizontalRule) asParser , #blank asParser star
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> italicFormat [
	^ self formatFor: italicMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> italicMarkup [
	^ (Markups at: PRItalicFormat) asParser
]

{ #category : #'grammar - Text' }
PRPillarGrammarOld >> lineBreak [
	^ #newline asParser , elementsAtLineBeginning not
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> lineEnd [
	^ #newline asParser / #eof asParser
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> link [
	^ linkMarkup , linkAlias optional , referenceLink , parametersLink optional , linkMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> linkAlias [
	^ ((escapedCharacter / (linkMarkup / referenceAliasMarkup) negate) star flatten, referenceAliasMarkup) ==> #first
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> linkMarkup [
	^ (Markups at: PRLink) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> list [
	self flag: #todo.	"The list elements should be trim."
	^ (unorderedList / orderedList / definitionList) memoized
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> listMarkup [
	^ orderedMarkup / unorderedMarkup / termMarkup / dataMarkup
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> lists [
	^ list plus
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> monospaceFormat [
	^ self formatFor: monospaceMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> monospaceMarkup [
	^ (Markups at: PRMonospaceFormat) asParser
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> oneLineContent [
	^ (otherContent / text) plus
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> orderedBasicListItem [
	^ (orderedMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> orderedList [
	^ orderedListItem plus
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> orderedListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ orderedMarkup and , orderedBasicListItem optional , ((commentedLine , #newline asParser) ==> [ :array | array first ]) star , orderedSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> orderedMarkup [
	^ (Markups at: PROrderedList) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> orderedSubListItem [
	^ ((orderedMarkup , subList) / (commentedLine , #newline asParser) flatten) plus
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> otherContent [
	^ format / annotation / reference / raw
]

{ #category : #'grammar - Paragraph' }
PRPillarGrammarOld >> paragraph [
	^ contents , lineEnd
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterKeyUntilEndAnnotation [
	^ self parameterKeyUntilParser: annotationEndMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterKeyUntilEndFigure [
	^ self parameterKeyUntilParser: figureMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterKeyUntilEndLink [
	^ self parameterKeyUntilParser: linkMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterKeyUntilNewline [
	^ self parameterKeyUntilParser: #newline asParser
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterKeyUntilParser: aParser [
	^ (escapedCharacter / (aParser / parameterMarkup / parameterValueMarkup) negate) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterMarkup [
	^ self class defaultMarkupParameter asParser
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterUntilEndAnnotation [
	^ parameterKeyUntilEndAnnotation , parameterValueUntilEndAnnotation optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterUntilEndFigure [
	^ parameterKeyUntilEndFigure , parameterValueUntilEndFigure optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterUntilEndLink [
	^ parameterKeyUntilEndLink , parameterValueUntilEndLink optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterUntilNewline [
	^ parameterKeyUntilNewline , parameterValueUntilNewline optional
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterValue [
	^ (figureMarkup / parameterMarkup) negate star flatten
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterValueMarkup [
	^ self class defaultMarkupParameterValue asParser
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterValueUntilEndAnnotation [
	^ self parameterValueUntilParser: annotationEndMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterValueUntilEndFigure [
	^ self parameterValueUntilParser: figureMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterValueUntilEndLink [
	^ self parameterValueUntilParser: linkMarkup
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterValueUntilNewline [
	^ self parameterValueUntilParser: #newline asParser
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parameterValueUntilParser: aParser [
	^ (parameterValueMarkup , (escapedCharacter / (aParser / parameterMarkup) negate) star) ==> [ :array | array second ]
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> parametersFigure [
	^ (parameterMarkup , parametersUntilEndFigure) ==> [ :array | array second ]
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> parametersLink [
	^ (parameterMarkup , parametersUntilEndLink) ==> #second
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parametersUntilEndAnnotation [
	^ parameterUntilEndAnnotation , ((parameterMarkup , parameterUntilEndAnnotation) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parametersUntilEndFigure [
	^ parameterUntilEndFigure
		, ((parameterMarkup , parameterUntilEndFigure) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parametersUntilEndLink [
	^ parameterUntilEndLink
		, ((parameterMarkup , parameterUntilEndLink) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRPillarGrammarOld >> parametersUntilNewline [
	^ parameterUntilNewline , ((parameterMarkup , parameterUntilNewline) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Text' }
PRPillarGrammarOld >> preformatedLine [
	^ (Markups at: PRPreformatted) asParser , lineEnd negate star flatten , lineEnd
]

{ #category : #'grammar - Text' }
PRPillarGrammarOld >> preformatedText [
	^ preformatedLine plus
]

{ #category : #'grammar - Raw' }
PRPillarGrammarOld >> raw [
	^ (Markups at: PRRaw) asParser , rawType optional
		, rawEndMarkup negate star flatten , rawEndMarkup
]

{ #category : #'grammar - Raw' }
PRPillarGrammarOld >> rawEndMarkup [
	^ (EndMarkups at: PRRaw) asParser
]

{ #category : #'grammar - Raw' }
PRPillarGrammarOld >> rawType [
	^ (rawEndMarkup / rawTypeMarkup) negate plus flatten , rawTypeMarkup ==> [ :array | array first ] 
]

{ #category : #'grammar - Raw' }
PRPillarGrammarOld >> rawTypeMarkup [
	^ self class defaultMarkupRawType asParser
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> reference [
	^ link / figure
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> referenceAliasMarkup [
	^ self class defaultMarkupReferenceAlias asParser
]

{ #category : #'from markdown' }
PRPillarGrammarOld >> referenceContent [
	^ (escapedCharacter / specialReferenceMarkups negate) plus
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> referenceFigure [
	^ self referenceUntil: figureMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> referenceLink [
	^ self referenceUntil: linkMarkup
]

{ #category : #'grammar - Reference' }
PRPillarGrammarOld >> referenceUntil: aParser [
	^ (escapedCharacter / (aParser / parameterMarkup / #newline asParser) negate) plus
]

{ #category : #'grammar - Script' }
PRPillarGrammarOld >> script [
	| endParser |
	endParser := #newline asParser , (EndMarkups at: PRCodeblock) asParser , space star , lineEnd.
	^ (Markups at: PRCodeblock) asParser , scriptParameters , endParser negate plus flatten , endParser
]

{ #category : #'grammar - Script' }
PRPillarGrammarOld >> scriptParameters [
	^ parametersUntilNewline , #newline asParser ==> [ :array | array first ]
]

{ #category : #'from markdown' }
PRPillarGrammarOld >> space [
	^ #blank asParser
]

{ #category : #'from markdown' }
PRPillarGrammarOld >> specialFormatMarkups [
	^ boldMarkup  / italicMarkup / monospaceMarkup / strikethroughMarkup / subscriptMarkup / superscriptMarkup / underlineMarkup
]

{ #category : #'from markdown' }
PRPillarGrammarOld >> specialReferenceMarkups [
	^ referenceAliasMarkup / linkMarkup / figureMarkup
]

{ #category : #'grammar - Document' }
PRPillarGrammarOld >> start [
	^ document end
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> strikethroughFormat [
	^ self formatFor: strikethroughMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> strikethroughMarkup [
	^ (Markups at: PRStrikethroughFormat) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> subList [
	^ (listMarkup plus , oneLineContent optional , lineEnd) flatten
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> subscriptFormat [
	^ self formatFor: subscriptMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> subscriptMarkup [
	^ (Markups at: PRSubscriptFormat) asParser
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> superscriptFormat [
	^ self formatFor: superscriptMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> superscriptMarkup [
	^ (Markups at: PRSuperscriptFormat) asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> table [
	self flag: #todo. "Add the possibility to have comment inside a table. See PRPillarGrammarTest>>testTableWithComment."
	^ tableRow plus
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableAlignMarkup [
	^ tableCenterMarkup / tableLeftMarkup / tableRightMarkup
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableCell [
	| cellSeparator |
	cellSeparator := (Markups at: PRTableCell) asParser.
	^ tableMarkups , (escapedCharacter / (cellSeparator / lineEnd) negate) star flatten
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableCenterMarkup [
	^ self class defaultMarkupTableCenter asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableHeadingMarkup [
	^ self class defaultMarkupTableHeader asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableLeftMarkup [
	^ self class defaultMarkupTableLeft asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableMarkups [
	| optionalParser |
	self flag: #todo.	"In the future we will define the alignement before the headind."
	optionalParser := (tableAlignMarkup / tableHeadingMarkup) optional.
	^ (Markups at: PRTableCell) asParser , optionalParser , optionalParser
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableRightMarkup [
	^ self class defaultMarkupTableRight asParser
]

{ #category : #'grammar - Table' }
PRPillarGrammarOld >> tableRow [
	^ tableCell plus , lineEnd
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> termBasicListItem [
	^ (termMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> termListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ termMarkup and , termBasicListItem optional , ((commentedLine , #newline asParser) ==> [ :array | array first ]) star , termSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> termMarkup [
	^ (Markups at: PRTermItem) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> termSubListItem [
	^ ((termMarkup , subList) / (commentedLine , #newline asParser) flatten) plus
]

{ #category : #'grammar - Text' }
PRPillarGrammarOld >> text [
	"Everything that is a pure text and nothing else (not a format, not a link, ...)"
	^  (escapedCharacter / ((#newline asParser , elementsAtLineBeginning) / otherContent / lineEnd) negate) plus
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> underlineFormat [
	^ self formatFor: underlineMarkup
]

{ #category : #'grammar - Format' }
PRPillarGrammarOld >> underlineMarkup [
	^ (Markups at: PRUnderlineFormat) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> unorderedBasicListItem [
	^ (unorderedMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> unorderedList [
	^ unorderedListItem plus
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> unorderedListItem [
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ unorderedMarkup and , unorderedBasicListItem optional , ((commentedLine , #newline asParser) ==> [ :array | array first ]) star , unorderedSubListItem optional
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> unorderedMarkup [
	^ (Markups at: PRUnorderedList) asParser
]

{ #category : #'grammar - List' }
PRPillarGrammarOld >> unorderedSubListItem [
	^ ((unorderedMarkup , subList) / (commentedLine , #newline asParser) flatten) plus
]
