Class {
	#name : #PRPillarGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#instVars : [
		'factory'
	],
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #'tests - Script' }
PRPillarGrammarTest >> codeBlockSample [
	^ factory codeBlockSample 
]

{ #category : #accessing }
PRPillarGrammarTest >> factory [

	^ factory 
]

{ #category : #accessing }
PRPillarGrammarTest >> factory: aFactory [

	factory := aFactory
]

{ #category : #accessing }
PRPillarGrammarTest >> parserClass [
	^ PRPillarGrammar
]

{ #category : #running }
PRPillarGrammarTest >> setUp [ 
	super setUp.
	self factory: PillarSnippetFactory new.
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testAliasFigure [
	self parse: factory aliasFigureSample rule: #figureAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testAliasFigureEscape [
	self parse: factory aliasFigureEscapeSample rule: #figureAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testAliasLink [
	self parse: factory aliasLinkSample rule: #linkAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testAliasLinkEscape [
	self parse: factory aliasLinkEscapeSample rule: #linkAlias
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchor [
	self parse: factory anchorSample rule: #anchor
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchorAreTrimed [
	self parse: factory anchorAreTrimedSample rule: #anchor
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchorWithNewLine [
	self parse: factory anchorWithNewLineSample rule: #elementWithNewline
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchorWithSpaceInside [
	self parse: factory anchorWithSpaceInsideSample rule: #anchor
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testAnnotatedParagraph [
	self
		parse: factory annotatedParagraphSample
		rule: #annotatedParagraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testAnnotatedParagraphEmpty [
	self
		parse: factory annotatedParagraphEmptySample
		rule: #annotatedParagraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testAnnotatedParagraphEmptyWithNewLine [
	self
		parse: factory annotatedParagraphEmptyWithNewLineSample
		rule: #elementWithNewline
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotation [
	self parse: factory annotationSample rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationAreTrimedAtTheRight [
	self
		parse: factory annotationAreTrimedAtTheRightSample
		rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationOnlyWithParameterName [
	self
		parse: factory annotationOnlyWithParameterNameSample
		rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationParameter [
	self
		parse: factory annotationParameterSample
		rule: #parameterUntilEndAnnotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationParameters [
	self
		parse: factory annotationParametersSample
		rule: #annotationParameters
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationParameters2 [
	self
		parse: factory annotationParameters2Sample
		rule: #parametersUntilEndAnnotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationTag [
	self parse: factory annotationTagSample rule: #annotationTag
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithUnknownKey [
	self parse: factory annotationWithUnknownKeySample rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithoutFirstParameterNameAndDefaultValues [
	self
		parse: factory annotationWithoutFirstParameterNameAndDefaultValuesSample
		rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithoutParameterName [
	self
		parse: factory annotationWithoutParameterNameSample
		rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithoutParameters [
	self
		parse: factory annotationWithoutParametersSample
		rule: #annotation
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testBoldFormat [
	self parse: factory boldFormatSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testBoldFormatEmpty [
	self parse: factory boldFormatEmptySample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testBoldFormatWithEscaped [
	self parse: factory boldFormatWithEscapedSample rule: #format
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testCommentedLine [
	self parse: factory commentedLineSample rule: #commentedLine
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testCommentedLineWithNewline [
	self
		parse: factory commentedLineWithNewlineSample
		rule: #elementWithNewline
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testDefinitionList [
	self parse: factory definitionListSample rule: #definitionList
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testEmptyParagraph [
	self parse: factory emptyParagraphSample rule: #emptyParagraph
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testEscapedCharacter [
	self parse: factory escapedCharacterSample rule: #escapedCharacter
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testFigureFollowedByLinkWithAlias [
	self
		parse: factory figureFollowedByLinkWithAliasSample
		rule: #paragraph
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testFormatWithLink [
	self parse: factory formatWithLinkSample rule: #format
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderEmpty [
	self parse: factory headerEmptySample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel1 [
	self parse: factory headerLevel1Sample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel2 [
	self parse: factory headerLevel2Sample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel3 [
	self parse: factory headerLevel3Sample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel4 [
	self parse: factory headerLevel4Sample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel5 [
	self parse: factory headerLevel5Sample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel6 [
	self parse: factory headerLevel6Sample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithFormat [
	self parse: factory headerWithFormatSample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithFormatAndText [
	self parse: factory headerWithFormatAndTextSample rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithNewLine [
	self parse: factory headerWithNewLineSample rule: #elementWithNewline
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithWithLink [
	self parse: factory headerWithWithLinkSample rule: #header
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarTest >> testHorizontalRule [
	self parse: factory horizontalRuleSample rule: #horizontalRule
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarTest >> testHorizontalRuleFollowByNewLine [
	self
		parse: factory horizontalRuleFollowByNewLineSample
		rule: #elementWithNewline
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarTest >> testHorizontalRuleTrimRight [
	self
		parse: factory horizontalRuleTrimRightSample
		rule: #horizontalRule
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testItalicFormat [
	self parse: factory italicFormatSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testItalicFormatEmpty [
	self parse: factory italicFormatEmptySample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testItalicFormatWithEscaped [
	self parse: factory italicFormatWithEscapedSample rule: #format
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testLineEnd [
	self parse: factory lineEndSample rule: #lineEnd
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testLineEndwithNewline [
	self parse: factory lineEndwithNewlineSample rule: #lineEnd
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testLinkFollowedByFigureWithAlias [
	self
		parse: factory linkFollowedByFigureWithAliasSample
		rule: #paragraph
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testListMulti [
	self parse: factory listMultiSample rule: #list
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testListWithComment [
	self parse: factory listWithCommentSample rule: #list
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testMonospaceFormat [
	self parse: factory monospaceFormatSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testMonospaceFormatEmpty [
	self parse: factory monospaceFormatEmptySample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testMonospaceFormatWithEscaped [
	self parse: factory monospaceFormatWithEscapedSample rule: #format
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewline [
	self parse: factory newlineSample rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewlineCR [
	self parse: factory newlineCRSample rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewlineCRLF [
	self parse: factory newlineCRLFSample rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewlineLF [
	self parse: factory newlineLFSample rule: #newline
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedList [
	self parse: factory orderedListSample rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedListEmpty [
	self parse: factory orderedListEmptySample rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedListMulti [
	self parse: factory orderedListMultiSample rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedListWithSubList [
	self parse: factory orderedListWithSubListSample rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedListWithTwoItems [
	self parse: factory orderedListWithTwoItemsSample rule: #orderedList
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testParagraph [
	self parse: factory paragraphSample rule: #paragraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testParagraphWithFormat [
	self parse: factory paragraphWithFormatSample rule: #paragraph
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParameterFigure [
	self
		parse: factory parameterFigureSample
		rule: #parameterUntilEndFigure
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParameterKeyUntilNewline [
	self
		parse: factory parameterKeyUntilNewlineSample
		rule: #parameterKeyUntilNewline
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParameterLink [
	self parse: factory parameterLinkSample rule: #parameterUntilEndLink
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParameterUntilNewline [
	self
		parse: factory parameterUntilNewlineSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParameterValueUntilNewline [
	self
		parse: factory parameterValueUntilNewlineSample
		rule: #parameterValueUntilNewline
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParametersFigure [
	self parse: factory parametersFigureSample rule: #parametersFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParametersLink [
	self parse: factory parametersLinkSample rule: #parametersLink
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParametersUntilNewline [
	self
		parse: factory parametersUntilNewlineSample
		rule: #parametersUntilNewline
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedLine [
	self parse: factory preformatedLineSample rule: #preformatedLine
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedText [
	self parse: factory preformatedTextSample rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextEmpty [
	self parse: factory preformatedTextEmptySample rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithMultiLines [
	self
		parse: factory preformatedTextWithMultiLinesSample
		rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithNewline [
	self
		parse: factory preformatedTextWithNewlineSample
		rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithSpaces [
	self
		parse: factory preformatedTextWithSpacesSample
		rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithTab [
	self
		parse: factory preformatedTextWithTabSample
		rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRaw [
	self parse: factory rawSample rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawEmpty [
	self parse: factory rawEmptySample rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawHTML [
	self parse: factory rawHTMLSample rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawInvalid [
	self parse: factory rawInvalidSample rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawMultiLines [
	self parse: factory rawMultiLinesSample rule: #raw
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReference [
	self parse: factory referenceSample rule: #reference
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceFigure [
	self parse: factory referenceFigureSample rule: #referenceFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceFigureEscape [
	self
		parse: factory referenceFigureEscapeSample
		rule: #referenceFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceLink [
	self parse: factory referenceLinkSample rule: #referenceLink
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceLinkEscape [
	self parse: factory referenceLinkEscapeSample rule: #referenceLink
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScript [
	self parse: factory scriptSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameter [
	self
		parse: factory scriptParameterSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterEscape [
	self
		parse: factory scriptParameterEscapeSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterTrueByDefault [
	self parse: factory scriptParameterTrueByDefaultSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterValue [
	self
		parse: factory scriptParameterValueSample
		rule: #parameterValueUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithFloat [
	self parse: factory scriptParameterWithFloatSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithLiteralArray [
	self
		parse: factory scriptParameterWithLiteralArraySample
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithNoValues [
	self parse: factory scriptParameterWithNoValuesSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithSpacesBeforeAndAfter [
	self
		parse: factory scriptParameterWithSpacesBeforeAndAfterSample
		rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithoutValue [
	self
		parse: factory scriptParameterWithoutValueSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameters [
	self parse: factory scriptParametersSample rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParametersEscape [
	self
		parse: factory scriptParametersEscapeSample
		rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParametersMultiple [
	self
		parse: factory scriptParametersMultipleSample
		rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptTwoParametersNoValue [
	self
		parse: factory scriptTwoParametersNoValueSample
		rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithLanguage [
	self parse: factory scriptWithLanguageSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithNewLine [
	self parse: factory scriptWithNewLineSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithSpaceAtTheEnd [
	self parse: factory scriptWithSpaceAtTheEndSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithSpacedParameters [
	self parse: factory scriptWithSpacedParametersSample rule: #script
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testStrikethroughFormat [
	self parse: factory strikethroughFormatSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testStrikethroughFormatEmpty [
	self parse: factory strikethroughFormatEmptySample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testStrikethroughFormatWithEscaped [
	self
		parse: factory strikethroughFormatWithEscapedSample
		rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSubscriptFormat [
	self parse: factory subscriptFormatSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSubscriptFormatEmpty [
	self parse: factory subscriptFormatEmptySample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSubscriptFormatWithEscaped [
	self parse: factory subscriptFormatWithEscapedSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSuperscriptFormat [
	self parse: factory superscriptFormatSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSuperscriptFormatEmpty [
	self parse: factory superscriptFormatEmptySample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSuperscriptFormatWithEscaped [
	self parse: factory superscriptFormatWithEscapedSample rule: #format
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTable [
	self parse: factory tableSample rule: #table
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableAlignMarkup [
	self parse: factory tableAlignMarkupSample rule: #tableAlignMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCell [
	self parse: factory tableCellSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellAreTrimed [
	self parse: factory tableCellAreTrimedSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellCenter [
	self parse: factory tableCellCenterSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeader [
	self parse: factory tableCellHeaderSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderCenter [
	self parse: factory tableCellHeaderCenterSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderCenter2 [
	self parse: factory tableCellHeaderCenter2Sample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderLeft [
	self parse: factory tableCellHeaderLeftSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderLeft2 [
	self parse: factory tableCellHeaderLeft2Sample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderRight [
	self parse: factory tableCellHeaderRightSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderRight2 [
	self parse: factory tableCellHeaderRight2Sample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellLeft [
	self parse: factory tableCellLeftSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellRight [
	self parse: factory tableCellRightSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellWithFormat [
	self parse: factory tableCellWithFormatSample rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCenterMarkup [
	self parse: factory tableCenterMarkupSample rule: #tableCenterMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableHeadingMarkup [
	self
		parse: factory tableHeadingMarkupSample
		rule: #tableHeadingMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableLeftMarkup [
	self parse: factory tableLeftMarkupSample rule: #tableLeftMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkups [
	self parse: factory tableMarkupsSample rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsCenter [
	self parse: factory tableMarkupsCenterSample rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsHeading [
	self parse: factory tableMarkupsHeadingSample rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsHeadingAndCenter [
	self
		parse: factory tableMarkupsHeadingAndCenterSample
		rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsHeadingAndCenter2 [
	self
		parse: factory tableMarkupsHeadingAndCenter2Sample
		rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRightMarkup [
	self parse: factory tableRightMarkupSample rule: #tableRightMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRow [
	self parse: factory tableRowSample rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRowWithEmptyCells [
	self parse: factory tableRowWithEmptyCellsSample rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRowWithHeading [
	self parse: factory tableRowWithHeadingSample rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableWithComment [
	self flag: #todo	"We need to add that later."
	"self
		parse:
			'|Foo
%Comment
|Bar'
		rule: #table"
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableWithNewLine [
	self parse: factory tableWithNewLineSample rule: #table
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testText [
	self parse: factory textSample rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testTextWithEscapeAtBeginning [
	self parse: factory textWithEscapeAtBeginningSample rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testTextWithEscapeInTheMiddle [
	self parse: factory textWithEscapeInTheMiddleSample rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testTextWithMultiEscape [
	self parse: factory textWithMultiEscapeSample rule: #text
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testUndefinedAnnotation [
	self parse: factory undefinedAnnotationSample rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testUndefinedAnnotationWithParameters [
	self
		parse: factory undefinedAnnotationWithParametersSample
		rule: #annotation
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testUnderlineFormat [
	self parse: factory underlineFormatSample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testUnderlineFormatEmpty [
	self parse: factory underlineFormatEmptySample rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testUnderlineFormatWithEscaped [
	self parse: factory underlineFormatWithEscapedSample rule: #format
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedList [
	self parse: factory unorderedListSample rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedListEmpty [
	self parse: factory unorderedListEmptySample rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedListMulti [
	self parse: factory unorderedListMultiSample rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedListWithSubList [
	self
		parse: factory unorderedListWithSubListSample
		rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedListWithTwoItems [
	self
		parse: factory unorderedListWithTwoItemsSample
		rule: #unorderedList
]
