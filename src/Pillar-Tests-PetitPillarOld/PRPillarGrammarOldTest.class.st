Class {
	#name : #PRPillarGrammarOldTest,
	#superclass : #PPCompositeParserTest,
	#category : 'Pillar-Tests-PetitPillarOld'
}

{ #category : #accessing }
PRPillarGrammarOldTest >> parserClass [
	^ PRPillarGrammarOld
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testAliasFigure [
	self parse: 'Alias>' rule: #figureAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testAliasFigureEscape [
	self parse: 'Alias\>>' rule: #figureAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testAliasLink [
	self parse: 'Alias>' rule: #linkAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testAliasLinkEscape [
	self parse: 'Alias\>>' rule: #linkAlias
]

{ #category : #'tests - Anchor' }
PRPillarGrammarOldTest >> testAnchor [
	self parse: '@test' rule: #anchor
]

{ #category : #'tests - Anchor' }
PRPillarGrammarOldTest >> testAnchorAreTrimed [
	self parse: '@  test  ' rule: #anchor
]

{ #category : #'tests - Anchor' }
PRPillarGrammarOldTest >> testAnchorWithNewLine [
	self parse: '@foo
' rule: #elementWithNewline
]

{ #category : #'tests - Anchor' }
PRPillarGrammarOldTest >> testAnchorWithSpaceInside [
	self parse: '@foo bar' rule: #anchor
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarOldTest >> testAnnotatedParagraph [
	self parse: '@@foo Bar' rule: #annotatedParagraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarOldTest >> testAnnotatedParagraphEmpty [
	self parse: '@@foo' rule: #annotatedParagraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarOldTest >> testAnnotatedParagraphEmptyWithNewLine [
	self parse: '@@foo
' rule: #elementWithNewline
]

{ #category : #'tests - Annotation' }
PRPillarGrammarOldTest >> testAnnotation [
	self parse: '${inputFile:path=Foo}$' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarOldTest >> testAnnotationAreTrimedAtTheRight [
	self parse: '${inputFile:path=Foo}$  ' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarOldTest >> testAnnotationParameter [
	self parse: 'value=foo' rule: #parameterUntilEndAnnotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarOldTest >> testAnnotationParameters [
	self parse: ':foo=bar|timo=leon' rule: #annotationParameters
]

{ #category : #'tests - Annotation' }
PRPillarGrammarOldTest >> testAnnotationParameters2 [
	self parse: 'foo=bar|timo=leon' rule: #parametersUntilEndAnnotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarOldTest >> testAnnotationTag [
	self parse: 'mock' rule: #annotationTag
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testBoldFormat [
	self parse: '""Foo""' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testBoldFormatEmpty [
	self parse: '""""' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testBoldFormatWithEscaped [
	self parse: '""\"\"""' rule: #format
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testCommentedLine [
	self parse: '%some text' rule: #commentedLine
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testCommentedLineWithNewline [
	self parse: '%some text
' rule: #elementWithNewline
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testDefinitionList [
	self
		parse:
			';Foo
:Bar'
		rule: #definitionList
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarOldTest >> testEmptyParagraph [
	self
		parse:
			'
'
		rule: #emptyParagraph
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testEscapedCharacter [
	self parse: '\*' rule: #escapedCharacter
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testFigureFollowedByLinkWithAlias [
	self parse: '+file://TeapotWelcome.png+*Go>http://localhost*' rule: #paragraph
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testFormatWithLink [
	self parse: '""*foo*""' rule: #format
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderEmpty [
	self parse: '!' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderLevel1 [
	self parse: '!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderLevel2 [
	self parse: '!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderLevel3 [
	self parse: '!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderLevel4 [
	self parse: '!!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderLevel5 [
	self parse: '!!!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderLevel6 [
	self parse: '!!!!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderWithFormat [
	self parse: '!""Foo""' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderWithFormatAndText [
	self parse: '!""Foo"" bar' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderWithNewLine [
	self parse: '!Foo
' rule: #elementWithNewline
]

{ #category : #'tests - Header' }
PRPillarGrammarOldTest >> testHeaderWithWithLink [
	self parse: '! Foo *Link*' rule: #header
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarOldTest >> testHorizontalRule [
	self parse: '_' rule: #horizontalRule
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarOldTest >> testHorizontalRuleFollowByNewLine [
	self parse: '_
' rule: #elementWithNewline
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarOldTest >> testHorizontalRuleTrimRight [
	self parse: '_  ' rule: #horizontalRule
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testItalicFormat [
	self parse: '''''Foo''''' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testItalicFormatEmpty [
	self parse: '''''''''' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testItalicFormatWithEscaped [
	self parse: '''''\''\''''''' rule: #format
]

{ #category : #'tests - Document' }
PRPillarGrammarOldTest >> testLineEnd [
	self parse: '' rule: #lineEnd
]

{ #category : #'tests - Document' }
PRPillarGrammarOldTest >> testLineEndwithNewline [
	self parse: String lf rule: #lineEnd
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testLinkFollowedByFigureWithAlias [
	self parse: '*http://localhost*+Go>file://TeapotWelcome.png+' rule: #paragraph
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testListMulti [
	self
		parse:
			'-1
--2
---3
--4
--5
--6
-7
-##8'
		rule: #list
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testListWithComment [
	self
		parse:
			'#Foo
%Comment
#Bar'
		rule: #list
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testMonospaceFormat [
	self parse: '==Foo==' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testMonospaceFormatEmpty [
	self parse: '====' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testMonospaceFormatWithEscaped [
	self parse: '==\=\===' rule: #format
]

{ #category : #'tests - Document' }
PRPillarGrammarOldTest >> testNewline [
	self parse: Smalltalk os lineEnding rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarOldTest >> testNewlineCR [
	self parse: String cr rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarOldTest >> testNewlineCRLF [
	self parse: String crlf rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarOldTest >> testNewlineLF [
	self parse: String lf rule: #newline
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testOrderedList [
	self parse: '#Foo' rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testOrderedListEmpty [
	self parse: '#' rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testOrderedListMulti [
	self
		parse:
			'#1
##2
###3
##4
##5
##6
#7
###8'
		rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testOrderedListWithSubList [
	self
		parse:
			'#Foo
##Bar'
		rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testOrderedListWithTwoItems [
	self
		parse:
			'#Foo
#Bar'
		rule: #orderedList
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarOldTest >> testParagraph [
	self parse: 'This is a text' rule: #paragraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarOldTest >> testParagraphWithFormat [
	self parse: 'Foo ""Bar""' rule: #paragraph
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testParameterFigure [
	self parse: 'value=foo' rule: #parameterUntilEndFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testParameterLink [
	self parse: 'value=foo' rule: #parameterUntilEndLink
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testParametersFigure [
	self parse: '|foo=bar|timo=leon' rule: #parametersFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testParametersLink [
	self parse: '|foo=bar|timo=leon' rule: #parametersLink
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testPreformatedLine [
	self parse: '= Foo' rule: #preformatedLine
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testPreformatedText [
	self parse: '= Foo' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testPreformatedTextEmpty [
	self parse: '= ' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testPreformatedTextWithMultiLines [
	self
		parse:
			'= Foo
= Bar'
		rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testPreformatedTextWithNewline [
	self parse: '= Foo
' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testPreformatedTextWithSpaces [
	self parse: '=    Foo' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testPreformatedTextWithTab [
	self parse: '= 	Foo' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testRaw [
	self parse: '{{{mock:foo}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testRawEmpty [
	self parse: '{{{}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testRawHTML [
	self parse: '{{{html:foo}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testRawInvalid [
	self parse: '{{{invalid:foo}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testRawMultiLines [
	self parse: '{{{foo
bar}}}' rule: #raw
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testReference [
	self parse: '*foo>@bar*' rule: #reference
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testReferenceFigure [
	self parse: 'file://foo.png' rule: #referenceFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testReferenceFigureEscape [
	self parse: 'file://foo\+.png' rule: #referenceFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testReferenceLink [
	self parse: 'file://foo.png' rule: #referenceLink
]

{ #category : #'tests - Reference' }
PRPillarGrammarOldTest >> testReferenceLinkEscape [
	self parse: 'file://foo\*.png' rule: #referenceLink
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScript [
	self
		parse:
			'[[[
foo
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameter [
	self parse: 'value=foo' rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterEscape [
	self parse: 'value\==foo' rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterTrueByDefault [
	self
		parse:
			'[[[foo
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterValue [
	self parse: '=foo' rule: #parameterValueUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterWithFloat [
	self
		parse:
			'[[[ratio=0.8
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterWithLiteralArray [
	self
		parse:
			'[[[foo=#(1 2 true)
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterWithNoValues [
	self
		parse:
			'[[[foo=
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterWithSpacesBeforeAndAfter [
	self parse: ' foo = true | bar = 2 
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameterWithoutValue [
	self parse: 'foo' rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParameters [
	self parse: 'value=foo
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParametersEscape [
	self parse: 'value=foo\||bar
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptParametersMultiple [
	self parse: 'value=foo|bar
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptTwoParametersNoValue [
	self parse: 'foo|bar
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptWithLanguage [
	self
		parse:
			'[[[language=smalltalk
foo
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptWithNewLine [
	self
		parse:
			'[[[
foo
]]]
'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptWithSpaceAtTheEnd [
	self
		parse:
			'[[[
foo
]]]  '
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarOldTest >> testScriptWithSpacedParameters [
	self
		parse:
			'[[[ foo = true | bar = 2 
bla
]]]'
		rule: #script
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testStrikethroughFormat [
	self parse: '--Foo--' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testStrikethroughFormatEmpty [
	self parse: '----' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testStrikethroughFormatWithEscaped [
	self parse: '--\-\---' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testSubscriptFormat [
	self parse: '@@Foo@@' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testSubscriptFormatEmpty [
	self parse: '@@@@' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testSubscriptFormatWithEscaped [
	self parse: '@@\@\@@@' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testSuperscriptFormat [
	self parse: '^^Foo^^' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testSuperscriptFormatEmpty [
	self parse: '^^^^' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testSuperscriptFormatWithEscaped [
	self parse: '^^\^\^^^' rule: #format
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTable [
	self
		parse:
			'|! Foo |! Bar
| Foo2 | Bar2'
		rule: #table
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableAlignMarkup [
	self parse: '}' rule: #tableAlignMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCell [
	self parse: '|Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellAreTrimed [
	self parse: '|   Foo   ' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellCenter [
	self parse: '||Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellHeader [
	self parse: '|!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellHeaderCenter [
	self parse: '|!|Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellHeaderCenter2 [
	self parse: '||!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellHeaderLeft [
	self parse: '|!{Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellHeaderLeft2 [
	self parse: '|{!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellHeaderRight [
	self parse: '|!}Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellHeaderRight2 [
	self parse: '|}!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellLeft [
	self parse: '|{Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellRight [
	self parse: '|}Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCellWithFormat [
	self parse: '| ''''Foo'''' ' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableCenterMarkup [
	self parse: '|' rule: #tableCenterMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableHeadingMarkup [
	self parse: '!' rule: #tableHeadingMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableLeftMarkup [
	self parse: '{' rule: #tableLeftMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableMarkups [
	self parse: '|' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableMarkupsCenter [
	self parse: '||' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableMarkupsHeading [
	self parse: '|!' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableMarkupsHeadingAndCenter [
	self parse: '|!|' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableMarkupsHeadingAndCenter2 [
	self parse: '||!' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableRightMarkup [
	self parse: '}' rule: #tableRightMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableRow [
	self parse: '| Foo | Bar' rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableRowWithEmptyCells [
	self parse: '|  | ' rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableRowWithHeading [
	self parse: '|! Foo |! Bar' rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableWithComment [
	self flag: #todo	"We need to add that later."
	"self
		parse:
			'|Foo
%Comment
|Bar'
		rule: #table"
]

{ #category : #'tests - Table' }
PRPillarGrammarOldTest >> testTableWithNewLine [
	self
		parse:
			'|! Foo |! Bar
| Foo2 | Bar2
'
		rule: #table
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testText [
	self parse: 'Foo' rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testTextWithEscapeAtBeginning [
	self parse: '\*Foo' rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testTextWithEscapeInTheMiddle [
	self parse: 'Foo \* Bar' rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarOldTest >> testTextWithMultiEscape [
	self parse: '\*Foo\*' rule: #text
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testUnderlineFormat [
	self parse: '__Foo__' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testUnderlineFormatEmpty [
	self parse: '____' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarOldTest >> testUnderlineFormatWithEscaped [
	self parse: '__\_\___' rule: #format
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testUnorderedList [
	self parse: '-Foo' rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testUnorderedListEmpty [
	self parse: '-' rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testUnorderedListMulti [
	self
		parse:
			'-1
--2
---3
--4
--5
--6
-7
---8'
		rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testUnorderedListWithSubList [
	self
		parse:
			'-Foo
--Bar'
		rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarOldTest >> testUnorderedListWithTwoItems [
	self
		parse:
			'-Foo
-Bar'
		rule: #unorderedList
]
