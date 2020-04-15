Class {
	#name : #PRMicroDownGrammar,
	#superclass : #PP2CompositeNode,
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
		'figureAlias',
		'epsilonToken'
	],
	#classVars : [
		'EndMarkups',
		'Markups'
	],
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #'markup - text' }
PRMicroDownGrammar class >> abstractAnnotationMarkup [

	^ '${'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> anchorMarkup [

	^ '@'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> annotatedParagraphMarkup [

	^ '@@'
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> boldMarkup [

	^ '**'
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> codeblockMarkup [

	^ '```'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> commentedLineMarkup [

	^ '%'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> dataItemMarkup [

	^ ':'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultEndMarkups [
	| markups |
	markups := Dictionary new.
	markups
		at: PRAbstractAnnotation put: '}$';
		at: PRRaw put: '}}}';
		at: PRCodeblock put: self codeblockMarkup.
	^ markups
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupAnnotationSeparator [
	^ $:
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupParameter [
	^ '|'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupParameterValue [
	^ '='
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupRawType [
	^ ':'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupReferenceAlias [
	^ '>'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupReferenceAnchor [
	^ '@'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupTableCenter [
	^ '|'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupTableHeader [
	^ '!'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupTableLeft [
	^ '{'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkupTableRight [
	^ '}'
]

{ #category : #accessing }
PRMicroDownGrammar class >> defaultMarkups [
	^ self textMarkups , self lineMarkups
]

{ #category : #'class initialization' }
PRMicroDownGrammar class >> endMarkups [
	^ EndMarkups
]

{ #category : #'class initialization' }
PRMicroDownGrammar class >> endMarkups: anObject [
	EndMarkups := anObject
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> figureMarkup [
	^ '+'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> headerMarkup [

	^ '#'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> horizontalRuleMarkup [

	^ '_'
]

{ #category : #'class initialization' }
PRMicroDownGrammar class >> initialize [
	"self initialize"
	Markups := self defaultMarkups.
	EndMarkups := self defaultEndMarkups.
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> italicMarkup [
	^ '_'
]

{ #category : #accessing }
PRMicroDownGrammar class >> lineMarkups [
	| markups |
	markups := Dictionary new.
	markups
		at: PRAnchor put: self anchorMarkup;
		at: PRHeader put: self headerMarkup ;
		at: PROrderedList put: self orderedListMarkup;
		at: PRUnorderedList put: self unorderedListMarkup;
		at: PRDataItem put: self dataItemMarkup;
		at: PRTermItem put: self termItemMarkup;
		at: PRAnnotatedParagraph put: self annotatedParagraphMarkup;
		at: PRPreformatted put: self preformattedMarkup;
		at: PRHorizontalRule put: self horizontalRuleMarkup;
		at: PRCommentedLine put: self commentedLineMarkup;
		at: PRTableCell put: self tableCellMarkup.
	^ markups
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> linkMarkup [
	^ '*'
]

{ #category : #'class initialization' }
PRMicroDownGrammar class >> markups [
	^ Markups
]

{ #category : #'class initialization' }
PRMicroDownGrammar class >> markups: anObject [
	Markups := anObject
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> monospaceMarkup [
	^ '`'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> orderedListMarkup [

	^ '1. '
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> preformattedMarkup [

	^ '> '
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> rawMarkup [

	^ '{{{'
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> strikethroughMarkup [
	^ '--'
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> subscriptMarkup [
	^ '@@'
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> superscriptMarkup [
	^ '^^'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> tableCellMarkup [

	^ '|'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> termItemMarkup [

	^ ';'
]

{ #category : #accessing }
PRMicroDownGrammar class >> textMarkups [
	| markups |
	markups := Dictionary new.
	markups
		at: PRBoldFormat put: self boldMarkup;
		at: PRItalicFormat put: self italicMarkup;
		at: PRMonospaceFormat put: self monospaceMarkup;
		at: PRStrikethroughFormat put: self strikethroughMarkup;
		at: PRSubscriptFormat put: self subscriptMarkup;
		at: PRSuperscriptFormat put: self superscriptMarkup;
		at: PRUnderlineFormat put: self underlineMarkup;
		at: PRFigure put: self figureMarkup;
		at: PRLink put: self linkMarkup;
		at: PRCodeblock put: self codeblockMarkup;
		at: PRRaw put: self rawMarkup;
		at: PRAbstractAnnotation put: self abstractAnnotationMarkup.
	^ markups
]

{ #category : #'markup - text' }
PRMicroDownGrammar class >> underlineMarkup [
	^ '__'
]

{ #category : #'markup - line' }
PRMicroDownGrammar class >> unorderedListMarkup [

	^ '-'
]

{ #category : #'grammar - Anchor' }
PRMicroDownGrammar >> anchor [
	^ (Markups at: PRAnchor) asPParser , lineEnd negate plus flatten
]

{ #category : #'grammar - Paragraph' }
PRMicroDownGrammar >> annotatedParagraph [
	^	epsilonToken , 
		(Markups at: PRAnnotatedParagraph) asPParser , 
		($  asPParser / newline) negate star flatten , 
		($  asPParser , oneLineContent) optional ,
		epsilonToken 
]

{ #category : #'grammar - Annotation' }
PRMicroDownGrammar >> annotation [
	"Todo: An annotation should have the possibility to be outside of a paragraph."
	^	epsilonToken , 	
		(Markups at: PRAbstractAnnotation) asPParser , 
		annotationTag , 
		annotationParameters optional ,
		annotationEndMarkup , 
		epsilonToken ,
		#blank asPParser star
]

{ #category : #'grammar - Annotation' }
PRMicroDownGrammar >> annotationEndMarkup [
	^ (EndMarkups at: PRAbstractAnnotation) asPParser
]

{ #category : #'grammar - Annotation' }
PRMicroDownGrammar >> annotationMarkupSeparator [
	^ self class defaultMarkupAnnotationSeparator asPParser
]

{ #category : #'grammar - Annotation' }
PRMicroDownGrammar >> annotationParameters [
	^	epsilonToken , 	
		annotationMarkupSeparator ,
		epsilonToken , 
		parametersUntilEndAnnotation, 
		epsilonToken
]

{ #category : #'grammar - Annotation' }
PRMicroDownGrammar >> annotationTag [
	^ (escapedCharacter / annotationMarkupSeparator / annotationEndMarkup) negate plus
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> boldFormat [
	^ self formatFor: boldMarkup
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> boldMarkup [
	^ (Markups at: PRBoldFormat) asPParser
]

{ #category : #'grammar - Text' }
PRMicroDownGrammar >> commentedLine [
	^ epsilonToken , 
		(Markups at: PRCommentedLine) asPParser , 
		lineEnd negate star flatten ,
		epsilonToken
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> content [
	^ oneLineContent , lineBreak optional
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> contents [
	^ content plus
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> dataBasicListItem [
	^ (dataMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> dataListItem [
	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^	epsilonToken , 
		dataMarkup and , 
		dataBasicListItem optional , 
		((commentedLine , newline) ==> [ :array | array first ]) star , 
		dataSubListItem optional , 
		epsilonToken
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> dataMarkup [
	^ (Markups at: PRDataItem) asPParser
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> dataSubListItem [
	^ ((dataMarkup , subList) / (commentedLine , newline) flatten) plus
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> definitionList [
	^ 	epsilonToken ,
		(termListItem / dataListItem) plus , 
		epsilonToken
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> document [
	"A document contain everything that can be at the top of a document. It can contain for example some headers, paragraph, tables etc."

	^ (elementsAtLineBeginning / paragraph) star
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> elementWithNewline [
	^ (header / annotatedParagraph / anchor / commentedLine / horizontalRule , lineEnd) ==> #first
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> elementsAtLineBeginning [
	^  elementWithNewline / list / script / table / commentedLine / preformatedText / emptyParagraph
]

{ #category : #'grammar - Paragraph' }
PRMicroDownGrammar >> emptyParagraph [
	^ epsilonToken , 
		newline , 
		epsilonToken 
]

{ #category : #'grammar - Helper' }
PRMicroDownGrammar >> epsilonToken [
	^ #epsilon asPParser token
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> escapedCharacter [
	^ ($\ asPParser , #any asPParser) ==> #second
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> figure [
	^	epsilonToken , 
		figureMarkup , 
		figureAlias optional , 
		referenceFigure , 
		parametersFigure optional , 
		figureMarkup ,
		epsilonToken
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> figureAlias [
	^ 	epsilonToken ,
		(escapedCharacter / 
			(figureMarkup / referenceAliasMarkup) negate) star flatten , 
		epsilonToken ,
		referenceAliasMarkup
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> figureMarkup [
	^ (Markups at: PRFigure) asPParser
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> figureReference [
	^ (figureMarkup / parameterMarkup) negate plus flatten
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> format [
	"Now a format can be empty (use of star instead of plus in these parsers). Do we really want this ? Some unit tests specify that a format can be empty but we can remove them'."
	
	^ monospaceFormat / boldFormat / italicFormat / underlineFormat / strikethroughFormat / subscriptFormat / superscriptFormat
]

{ #category : #'from markdown' }
PRMicroDownGrammar >> formatContent [
	^ 	epsilonToken ,
		(escapedCharacter / specialFormatMarkups negate) plus ,
		epsilonToken
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> formatFor: aMarkupParser [
	^ 	epsilonToken ,
		aMarkupParser , 
		(aMarkupParser not , ( otherContent / formatContent)) star , 
		aMarkupParser,
		epsilonToken
]

{ #category : #'grammar - Header' }
PRMicroDownGrammar >> header [
	"A header begin by a certain amount of $! and contains a text and/or some formatedText"

	^ 	epsilonToken ,
		(Markups at: PRHeader) asPParser plus , 
		oneLineContent optional trimBlanks , 
		epsilonToken
]

{ #category : #'grammar - HorizontalRule' }
PRMicroDownGrammar >> horizontalRule [
	^ (Markups at: PRHorizontalRule) asPParser , #blank asPParser star
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> italicFormat [
	^ self formatFor: italicMarkup
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> italicMarkup [
	^ (Markups at: PRItalicFormat) asPParser
]

{ #category : #'grammar - Text' }
PRMicroDownGrammar >> lineBreak [
	^ newline , elementsAtLineBeginning not
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> lineEnd [
	^ newline / #eoi asPParser
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> link [
	^ 	epsilonToken , 
		linkMarkup , 
		linkAlias optional , 
		referenceLink , 
		parametersLink optional , 
		linkMarkup ,
		epsilonToken
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> linkAlias [
	^ 	epsilonToken , 
		(escapedCharacter / 
			(linkMarkup / referenceAliasMarkup) negate) star flatten , 
		epsilonToken ,
		referenceAliasMarkup
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> linkMarkup [
	^ (Markups at: PRLink) asPParser
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> list [
	"The list elements should be trim."
	^ (unorderedList / orderedList / definitionList) memoize
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> listMarkup [
	^ orderedMarkup / unorderedMarkup / termMarkup / dataMarkup
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> lists [
	^ list plus
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> monospaceFormat [
	^ self formatFor: monospaceMarkup
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> monospaceMarkup [
	^ (Markups at: PRMonospaceFormat) asPParser
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> newline [
	^ String crlf asPParser / String lf asPParser / String cr asPParser
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> oneLineContent [
	^ (otherContent / text) plus
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> orderedBasicListItem [
	^ (orderedMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> orderedList [
	^ 	epsilonToken , 
		orderedListItem plus , 
		epsilonToken
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> orderedListItem [
	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^	epsilonToken , 
		orderedMarkup and , 
		orderedBasicListItem optional , 
		((commentedLine , newline) ==> [ :array | array first ]) star , 
		orderedSubListItem optional ,
		epsilonToken
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> orderedMarkup [
	^ #digit asPParser, $. asPParser ", #blank asPParser star optional"
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> orderedSubListItem [
	^ ((orderedMarkup , subList) / (commentedLine , newline) flatten) plus
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> otherContent [
	^ format / annotation / reference / raw
]

{ #category : #'grammar - Paragraph' }
PRMicroDownGrammar >> paragraph [
	^ 	epsilonToken ,
		contents , 
		lineEnd ,
		epsilonToken
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterKeyUntilEndAnnotation [
	^ self parameterKeyUntilParser: annotationEndMarkup
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterKeyUntilEndFigure [
	^ self parameterKeyUntilParser: figureMarkup
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterKeyUntilEndLink [
	^ self parameterKeyUntilParser: linkMarkup
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterKeyUntilNewline [
	^ self parameterKeyUntilParser: newline
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterKeyUntilParser: aParser [
	^ 	epsilonToken ,
		(escapedCharacter / (aParser / parameterMarkup / parameterValueMarkup) negate) star,
		epsilonToken
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterMarkup [
	^ self class defaultMarkupParameter asPParser
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterUntilEndAnnotation [
	^ 	epsilonToken ,
		parameterKeyUntilEndAnnotation , 
		parameterValueUntilEndAnnotation optional , 
		epsilonToken 
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterUntilEndFigure [
	^ parameterKeyUntilEndFigure , parameterValueUntilEndFigure optional
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterUntilEndLink [
	^ parameterKeyUntilEndLink , parameterValueUntilEndLink optional
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterUntilNewline [
	^ parameterKeyUntilNewline , parameterValueUntilNewline optional
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterValue [
	^ (figureMarkup / parameterMarkup) negate star flatten
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterValueMarkup [
	^ self class defaultMarkupParameterValue asPParser
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterValueUntilEndAnnotation [
	^ self parameterValueUntilParser: annotationEndMarkup
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterValueUntilEndFigure [
	^ self parameterValueUntilParser: figureMarkup
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterValueUntilEndLink [
	^ self parameterValueUntilParser: linkMarkup
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterValueUntilNewline [
	^ self parameterValueUntilParser: newline
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parameterValueUntilParser: aParser [
	^ 	(parameterValueMarkup , 
		epsilonToken ,
		(escapedCharacter / (aParser / parameterMarkup) negate) star , 
		epsilonToken)
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> parametersFigure [
	^ (parameterMarkup , parametersUntilEndFigure) ==> [ :array | array second ]
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> parametersLink [
	^ (parameterMarkup , parametersUntilEndLink) ==> #second
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parametersUntilEndAnnotation [
	^ parameterUntilEndAnnotation , ((parameterMarkup , parameterUntilEndAnnotation) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parametersUntilEndFigure [
	^ parameterUntilEndFigure
		, ((parameterMarkup , parameterUntilEndFigure) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parametersUntilEndLink [
	^ parameterUntilEndLink
		, ((parameterMarkup , parameterUntilEndLink) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Parameter' }
PRMicroDownGrammar >> parametersUntilNewline [
	^ parameterUntilNewline , ((parameterMarkup , parameterUntilNewline) ==> [ :array | array second ]) star
]

{ #category : #'grammar - Text' }
PRMicroDownGrammar >> preformatedLine [
	^ (Markups at: PRPreformatted) asPParser , lineEnd negate star flatten , lineEnd
]

{ #category : #'grammar - Text' }
PRMicroDownGrammar >> preformatedText [
	^ preformatedLine plus
]

{ #category : #'grammar - Raw' }
PRMicroDownGrammar >> raw [
	^ (Markups at: PRRaw) asPParser , rawType optional
		, rawEndMarkup negate star flatten , rawEndMarkup
]

{ #category : #'grammar - Raw' }
PRMicroDownGrammar >> rawEndMarkup [
	^ (EndMarkups at: PRRaw) asPParser
]

{ #category : #'grammar - Raw' }
PRMicroDownGrammar >> rawType [
	^ (rawEndMarkup / rawTypeMarkup) negate plus flatten , rawTypeMarkup ==> [ :array | array first ] 
]

{ #category : #'grammar - Raw' }
PRMicroDownGrammar >> rawTypeMarkup [
	^ self class defaultMarkupRawType asPParser
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> reference [
	^ link / figure
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> referenceAliasMarkup [
	^ self class defaultMarkupReferenceAlias asPParser
]

{ #category : #'from markdown' }
PRMicroDownGrammar >> referenceContent [
	^ (escapedCharacter / specialReferenceMarkups negate) plus
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> referenceFigure [
	^ self referenceUntil: figureMarkup
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> referenceLink [
	^ self referenceUntil: linkMarkup
]

{ #category : #'grammar - Reference' }
PRMicroDownGrammar >> referenceUntil: aParser [
	^ (escapedCharacter / (aParser / parameterMarkup / newline) negate) plus
]

{ #category : #'grammar - Script' }
PRMicroDownGrammar >> script [
	| endParser |
	endParser := newline asPParser , (EndMarkups at: PRCodeblock) asPParser , space star , lineEnd.
	^	epsilonToken, 
		(Markups at: PRCodeblock) asPParser , 
		scriptParameters , 
		endParser negate plus flatten , 
		endParser,
		epsilonToken
]

{ #category : #'grammar - Script' }
PRMicroDownGrammar >> scriptParameters [
	^ parametersUntilNewline , newline ==> [ :array | array first ]
]

{ #category : #'from markdown' }
PRMicroDownGrammar >> space [
	^ #blank asPParser
]

{ #category : #'from markdown' }
PRMicroDownGrammar >> specialFormatMarkups [
	^ boldMarkup  / italicMarkup / monospaceMarkup / strikethroughMarkup / subscriptMarkup / superscriptMarkup / underlineMarkup
]

{ #category : #'from markdown' }
PRMicroDownGrammar >> specialReferenceMarkups [
	^ referenceAliasMarkup / linkMarkup / figureMarkup
]

{ #category : #'grammar - Document' }
PRMicroDownGrammar >> start [
	^ document end
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> strikethroughFormat [
	^ self formatFor: strikethroughMarkup
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> strikethroughMarkup [
	^ (Markups at: PRStrikethroughFormat) asPParser
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> subList [
	^ (listMarkup plus , oneLineContent optional , lineEnd) flatten
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> subscriptFormat [
	^ self formatFor: subscriptMarkup
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> subscriptMarkup [
	^ (Markups at: PRSubscriptFormat) asPParser
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> superscriptFormat [
	^ self formatFor: superscriptMarkup
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> superscriptMarkup [
	^ (Markups at: PRSuperscriptFormat) asPParser
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> table [
	"Todo: Add the possibility to have comment inside a table. See PRPillarGrammarTest>>testTableWithComment."
	^ tableRow plus
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableAlignMarkup [
	^ tableCenterMarkup / tableLeftMarkup / tableRightMarkup
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableCell [
	| cellSeparator |
	cellSeparator := (Markups at: PRTableCell) asPParser.
	^ tableMarkups , (escapedCharacter / (cellSeparator / lineEnd) negate) star flatten
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableCenterMarkup [
	^ self class defaultMarkupTableCenter asPParser
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableHeadingMarkup [
	^ self class defaultMarkupTableHeader asPParser
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableLeftMarkup [
	^ self class defaultMarkupTableLeft asPParser
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableMarkups [
	| optionalParser |
	optionalParser := (tableAlignMarkup / tableHeadingMarkup) optional.
	^ (Markups at: PRTableCell) asPParser , optionalParser , optionalParser
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableRightMarkup [
	^ self class defaultMarkupTableRight asPParser
]

{ #category : #'grammar - Table' }
PRMicroDownGrammar >> tableRow [
	^ tableCell plus , lineEnd
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> termBasicListItem [
	^ (termMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> termListItem [
	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^	epsilonToken , 
		termMarkup and , 
		termBasicListItem optional , 
		((commentedLine , newline) ==> [ :array | array first ]) star , 
		termSubListItem optional , 
		epsilonToken 
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> termMarkup [
	^ (Markups at: PRTermItem) asPParser
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> termSubListItem [
	^ ((termMarkup , subList) / (commentedLine , newline) flatten) plus
]

{ #category : #'grammar - Text' }
PRMicroDownGrammar >> text [
	"Everything that is a pure text and nothing else (not a format, not a link, ...)"
	^  epsilonToken, 
		(escapedCharacter / ((newline , elementsAtLineBeginning) / otherContent / lineEnd) negate) plus, 
		epsilonToken
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> underlineFormat [
	^ self formatFor: underlineMarkup
]

{ #category : #'grammar - Format' }
PRMicroDownGrammar >> underlineMarkup [
	^ (Markups at: PRUnderlineFormat) asPParser
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> unorderedBasicListItem [
	^ (unorderedMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> unorderedList [
	^ 	epsilonToken , 
		unorderedListItem plus , 
		epsilonToken
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> unorderedListItem [
	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^	epsilonToken , 
		unorderedMarkup and , 
		unorderedBasicListItem optional , 
		((commentedLine , newline) ==> [ :array | array first ]) star , 
		unorderedSubListItem optional ,
		epsilonToken
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> unorderedMarkup [
	^ (Markups at: PRUnorderedList) asPParser
]

{ #category : #'grammar - List' }
PRMicroDownGrammar >> unorderedSubListItem [
	^ ((unorderedMarkup , subList) / (commentedLine , newline) flatten) plus
]
