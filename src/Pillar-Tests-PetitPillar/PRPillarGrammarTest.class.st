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
PRPillarGrammarTest >> parse: aString rule: aSymbol [
	
	"PillarSnippetFactory compile: (testSelector allButFirst: 4) uncapitalized , 'Sample', String cr, String tab, '^ ''', aString , '''' classified: 'sample'."
	
	^ super parse: aString rule: aSymbol
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
	self parse: 'Alias>' rule: #figureAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testAliasFigureEscape [
	self parse: 'Alias\>>' rule: #figureAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testAliasLink [
	self parse: 'Alias>' rule: #linkAlias
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testAliasLinkEscape [
	self parse: 'Alias\>>' rule: #linkAlias
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchor [
	self parse: factory anchorSample rule: #anchor
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchorAreTrimed [
	self parse: '@  test  ' rule: #anchor
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchorWithNewLine [
	self parse: '@foo
' rule: #elementWithNewline
]

{ #category : #'tests - Anchor' }
PRPillarGrammarTest >> testAnchorWithSpaceInside [
	self parse: '@foo bar' rule: #anchor
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testAnnotatedParagraph [
	self parse: '@@foo Bar' rule: #annotatedParagraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testAnnotatedParagraphEmpty [
	self parse: '@@foo' rule: #annotatedParagraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testAnnotatedParagraphEmptyWithNewLine [
	self parse: '@@foo
' rule: #elementWithNewline
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotation [
	self parse: '${inputFile:path=Foo}$' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationAreTrimedAtTheRight [
	self parse: '${inputFile:path=Foo}$  ' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationOnlyWithParameterName [
	self parse: '${inputFile:path}$' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationParameter [
	self parse: 'value=foo' rule: #parameterUntilEndAnnotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationParameters [
	self parse: ':foo=bar|timo=leon' rule: #annotationParameters
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationParameters2 [
	self parse: 'foo=bar|timo=leon' rule: #parametersUntilEndAnnotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationTag [
	self parse: 'mock' rule: #annotationTag
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithUnknownKey [
	self parse: '${inputFile:path=Foo|unknownKey=Bar}$' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithoutFirstParameterNameAndDefaultValues [
	self parse: '${docList:Foo|limit|sort}$' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithoutParameterName [
	self parse: '${inputFile:Foo}$' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testAnnotationWithoutParameters [
	self parse: '${inputFile}$' rule: #annotation
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testBoldFormat [
	self parse: '""Foo""' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testBoldFormatEmpty [
	self parse: '""""' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testBoldFormatWithEscaped [
	self parse: '""\"\"""' rule: #format
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testCommentedLine [
	self parse: '%some text' rule: #commentedLine
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testCommentedLineWithNewline [
	self parse: '%some text
' rule: #elementWithNewline
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testDefinitionList [
	self
		parse:
			';Foo
:Bar'
		rule: #definitionList
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testEmptyParagraph [
	self
		parse:
			'
'
		rule: #emptyParagraph
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testEscapedCharacter [
	self parse: '\*' rule: #escapedCharacter
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testFigureFollowedByLinkWithAlias [
	self parse: '+file://TeapotWelcome.png+*Go>http://localhost*' rule: #paragraph
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testFormatWithLink [
	self parse: '""*foo*""' rule: #format
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderEmpty [
	self parse: '!' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel1 [
	self parse: '!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel2 [
	self parse: '!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel3 [
	self parse: '!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel4 [
	self parse: '!!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel5 [
	self parse: '!!!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderLevel6 [
	self parse: '!!!!!!Foo' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithFormat [
	self parse: '!""Foo""' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithFormatAndText [
	self parse: '!""Foo"" bar' rule: #header
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithNewLine [
	self parse: '!Foo
' rule: #elementWithNewline
]

{ #category : #'tests - Header' }
PRPillarGrammarTest >> testHeaderWithWithLink [
	self parse: '! Foo *Link*' rule: #header
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarTest >> testHorizontalRule [
	self parse: '_' rule: #horizontalRule
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarTest >> testHorizontalRuleFollowByNewLine [
	self parse: '_
' rule: #elementWithNewline
]

{ #category : #'tests - HorizontalRule' }
PRPillarGrammarTest >> testHorizontalRuleTrimRight [
	self parse: '_  ' rule: #horizontalRule
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testItalicFormat [
	self parse: '''''Foo''''' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testItalicFormatEmpty [
	self parse: '''''''''' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testItalicFormatWithEscaped [
	self parse: '''''\''\''''''' rule: #format
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testLineEnd [
	self parse: '' rule: #lineEnd
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testLineEndwithNewline [
	self parse: String lf rule: #lineEnd
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testLinkFollowedByFigureWithAlias [
	self parse: '*http://localhost*+Go>file://TeapotWelcome.png+' rule: #paragraph
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testListMulti [
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
PRPillarGrammarTest >> testListWithComment [
	self
		parse:
			'#Foo
%Comment
#Bar'
		rule: #list
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testMonospaceFormat [
	self parse: '==Foo==' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testMonospaceFormatEmpty [
	self parse: '====' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testMonospaceFormatWithEscaped [
	self parse: '==\=\===' rule: #format
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewline [
	self parse: Smalltalk os lineEnding rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewlineCR [
	self parse: String cr rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewlineCRLF [
	self parse: String crlf rule: #newline
]

{ #category : #'tests - Document' }
PRPillarGrammarTest >> testNewlineLF [
	self parse: String lf rule: #newline
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedList [
	self parse: '#Foo' rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedListEmpty [
	self parse: '#' rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedListMulti [
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
PRPillarGrammarTest >> testOrderedListWithSubList [
	self
		parse:
			'#Foo
##Bar'
		rule: #orderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testOrderedListWithTwoItems [
	self
		parse:
			'#Foo
#Bar'
		rule: #orderedList
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testParagraph [
	self parse: 'This is a text' rule: #paragraph
]

{ #category : #'tests - Paragraph' }
PRPillarGrammarTest >> testParagraphWithFormat [
	self parse: 'Foo ""Bar""' rule: #paragraph
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParameterFigure [
	self parse: 'value=foo' rule: #parameterUntilEndFigure
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParameterKeyUntilNewline [
	self parse: 'parameterName' rule: #parameterKeyUntilNewline
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParameterLink [
	self parse: 'value=foo' rule: #parameterUntilEndLink
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParameterUntilNewline [
	self parse: 'foo=bar' rule: #parameterUntilNewline
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParameterValueUntilNewline [
	self parse: '=parameterValue' rule: #parameterValueUntilNewline
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParametersFigure [
	self parse: '|foo=bar|timo=leon' rule: #parametersFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testParametersLink [
	self parse: '|foo=bar|timo=leon' rule: #parametersLink
]

{ #category : #'tests - Parameter' }
PRPillarGrammarTest >> testParametersUntilNewline [
	self parse: 'foo=bar|baz=true' rule: #parametersUntilNewline
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedLine [
	self parse: '= Foo' rule: #preformatedLine
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedText [
	self parse: '= Foo' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextEmpty [
	self parse: '= ' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithMultiLines [
	self
		parse:
			'= Foo
= Bar'
		rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithNewline [
	self parse: '= Foo
' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithSpaces [
	self parse: '=    Foo' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testPreformatedTextWithTab [
	self parse: '= 	Foo' rule: #preformatedText
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRaw [
	self parse: '{{{mock:foo}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawEmpty [
	self parse: '{{{}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawHTML [
	self parse: '{{{html:foo}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawInvalid [
	self parse: '{{{invalid:foo}}}' rule: #raw
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testRawMultiLines [
	self parse: '{{{foo
bar}}}' rule: #raw
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReference [
	self parse: factory referenceSample rule: #reference
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceFigure [
	self parse: 'file://foo.png' rule: #referenceFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceFigureEscape [
	self parse: 'file://foo\+.png' rule: #referenceFigure
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceLink [
	self parse: 'file://foo.png' rule: #referenceLink
]

{ #category : #'tests - Reference' }
PRPillarGrammarTest >> testReferenceLinkEscape [
	self parse: 'file://foo\*.png' rule: #referenceLink
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScript [
	self parse: self codeBlockSample rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameter [
	self parse: 'value=foo' rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterEscape [
	self parse: 'value\==foo' rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterTrueByDefault [
	self
		parse:
			'[[[foo
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterValue [
	self parse: '=foo' rule: #parameterValueUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithFloat [
	self
		parse:
			'[[[ratio=0.8
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithLiteralArray [
	self
		parse:
			'[[[foo=#(1 2 true)
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithNoValues [
	self
		parse:
			'[[[foo=
bar
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithSpacesBeforeAndAfter [
	self parse: ' foo = true | bar = 2 
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameterWithoutValue [
	self parse: 'foo' rule: #parameterUntilNewline
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParameters [
	self parse: 'value=foo
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParametersEscape [
	self parse: 'value=foo\||bar
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptParametersMultiple [
	self parse: 'value=foo|bar
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptTwoParametersNoValue [
	self parse: 'foo|bar
' rule: #scriptParameters
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithLanguage [
	self
		parse:
			'[[[language=smalltalk
foo
]]]'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithNewLine [
	self
		parse:
			'[[[
foo
]]]
'
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithSpaceAtTheEnd [
	self
		parse:
			'[[[
foo
]]]  '
		rule: #script
]

{ #category : #'tests - Script' }
PRPillarGrammarTest >> testScriptWithSpacedParameters [
	self
		parse:
			'[[[ foo = true | bar = 2 
bla
]]]'
		rule: #script
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testStrikethroughFormat [
	self parse: '--Foo--' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testStrikethroughFormatEmpty [
	self parse: '----' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testStrikethroughFormatWithEscaped [
	self parse: '--\-\---' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSubscriptFormat [
	self parse: '@@Foo@@' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSubscriptFormatEmpty [
	self parse: '@@@@' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSubscriptFormatWithEscaped [
	self parse: '@@\@\@@@' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSuperscriptFormat [
	self parse: '^^Foo^^' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSuperscriptFormatEmpty [
	self parse: '^^^^' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testSuperscriptFormatWithEscaped [
	self parse: '^^\^\^^^' rule: #format
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTable [
	self
		parse:
			'|! Foo |! Bar
| Foo2 | Bar2'
		rule: #table
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableAlignMarkup [
	self parse: '}' rule: #tableAlignMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCell [
	self parse: '|Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellAreTrimed [
	self parse: '|   Foo   ' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellCenter [
	self parse: '||Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeader [
	self parse: '|!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderCenter [
	self parse: '|!|Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderCenter2 [
	self parse: '||!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderLeft [
	self parse: '|!{Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderLeft2 [
	self parse: '|{!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderRight [
	self parse: '|!}Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellHeaderRight2 [
	self parse: '|}!Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellLeft [
	self parse: '|{Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellRight [
	self parse: '|}Foo' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCellWithFormat [
	self parse: '| ''''Foo'''' ' rule: #tableCell
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableCenterMarkup [
	self parse: '|' rule: #tableCenterMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableHeadingMarkup [
	self parse: '!' rule: #tableHeadingMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableLeftMarkup [
	self parse: '{' rule: #tableLeftMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkups [
	self parse: '|' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsCenter [
	self parse: '||' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsHeading [
	self parse: '|!' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsHeadingAndCenter [
	self parse: '|!|' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableMarkupsHeadingAndCenter2 [
	self parse: '||!' rule: #tableMarkups
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRightMarkup [
	self parse: '}' rule: #tableRightMarkup
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRow [
	self parse: '| Foo | Bar' rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRowWithEmptyCells [
	self parse: '|  | ' rule: #tableRow
]

{ #category : #'tests - Table' }
PRPillarGrammarTest >> testTableRowWithHeading [
	self parse: '|! Foo |! Bar' rule: #tableRow
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
	self
		parse:
			'|! Foo |! Bar
| Foo2 | Bar2
'
		rule: #table
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testText [
	self parse: 'Foo' rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testTextWithEscapeAtBeginning [
	self parse: '\*Foo' rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testTextWithEscapeInTheMiddle [
	self parse: 'Foo \* Bar' rule: #text
]

{ #category : #'tests - Text' }
PRPillarGrammarTest >> testTextWithMultiEscape [
	self parse: '\*Foo\*' rule: #text
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testUndefinedAnnotation [
	self parse: '${undefinedAnnotation}$' rule: #annotation
]

{ #category : #'tests - Annotation' }
PRPillarGrammarTest >> testUndefinedAnnotationWithParameters [
	self parse: '${undefinedAnnotation:param1=a|param2=b}$' rule: #annotation
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testUnderlineFormat [
	self parse: '__Foo__' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testUnderlineFormatEmpty [
	self parse: '____' rule: #format
]

{ #category : #'tests - Format' }
PRPillarGrammarTest >> testUnderlineFormatWithEscaped [
	self parse: '__\_\___' rule: #format
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedList [
	self parse: '-Foo' rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedListEmpty [
	self parse: '-' rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedListMulti [
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
PRPillarGrammarTest >> testUnorderedListWithSubList [
	self
		parse:
			'-Foo
--Bar'
		rule: #unorderedList
]

{ #category : #'tests - List' }
PRPillarGrammarTest >> testUnorderedListWithTwoItems [
	self
		parse:
			'-Foo
-Bar'
		rule: #unorderedList
]
