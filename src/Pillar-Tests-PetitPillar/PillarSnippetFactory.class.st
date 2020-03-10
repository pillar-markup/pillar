Class {
	#name : #PillarSnippetFactory,
	#superclass : #Object,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #sample }
PillarSnippetFactory >> aliasFigureEscapeSample [
	^ 'Alias\>>'
]

{ #category : #sample }
PillarSnippetFactory >> aliasFigureSample [
	^ 'Alias>'
]

{ #category : #sample }
PillarSnippetFactory >> aliasLinkEscapeSample [
	^ 'Alias\>>'
]

{ #category : #sample }
PillarSnippetFactory >> aliasLinkSample [
	^ 'Alias>'
]

{ #category : #sample }
PillarSnippetFactory >> anchorAreTrimedSample [
	^ '@  test  '
]

{ #category : #sample }
PillarSnippetFactory >> anchorSample [
	^ '@test'
]

{ #category : #sample }
PillarSnippetFactory >> anchorWithNewLineSample [
	^ '@foo
'
]

{ #category : #sample }
PillarSnippetFactory >> anchorWithSpaceInsideSample [
	^ '@foo bar'
]

{ #category : #sample }
PillarSnippetFactory >> annotatedParagraphEmptySample [
	^ '@@foo'
]

{ #category : #sample }
PillarSnippetFactory >> annotatedParagraphEmptyWithNewLineSample [
	^ '@@foo
'
]

{ #category : #sample }
PillarSnippetFactory >> annotatedParagraphSample [
	^ '@@foo Bar'
]

{ #category : #sample }
PillarSnippetFactory >> annotationAreTrimedAtTheRightSample [
	^ '${inputFile:path=Foo}$  '
]

{ #category : #sample }
PillarSnippetFactory >> annotationOnlyWithParameterNameSample [
	^ '${inputFile:path}$'
]

{ #category : #sample }
PillarSnippetFactory >> annotationParameterSample [
	^ 'value=foo'
]

{ #category : #sample }
PillarSnippetFactory >> annotationParameters2Sample [
	^ ':foo=bar|timo=leon'
]

{ #category : #sample }
PillarSnippetFactory >> annotationParametersSample [
	^ ':foo=bar|timo=leon'
]

{ #category : #sample }
PillarSnippetFactory >> annotationSample [
	^ '${inputFile:path=Foo}$'
]

{ #category : #sample }
PillarSnippetFactory >> annotationTagSample [
	^ 'mock'
]

{ #category : #sample }
PillarSnippetFactory >> annotationWithUnknownKeyAsNodeSample [
	^ '${inputFile:path=Foo|unknownKey=Bar}$'
]

{ #category : #sample }
PillarSnippetFactory >> annotationWithUnknownKeySample [
	^ '${inputFile:path=Foo|unknownKey=Bar}$'
]

{ #category : #sample }
PillarSnippetFactory >> annotationWithoutFirstParameterNameAndDefaultValuesSample [
	^ '${docList:Foo|limit|sort}$'
]

{ #category : #sample }
PillarSnippetFactory >> annotationWithoutParameterNameSample [
	^ '${inputFile:Foo}$'
]

{ #category : #sample }
PillarSnippetFactory >> annotationWithoutParametersAsNodeSample [
	^ '${inputFile}$'
]

{ #category : #sample }
PillarSnippetFactory >> annotationWithoutParametersSample [
	^ '${inputFile}$'
]

{ #category : #sample }
PillarSnippetFactory >> boldFormatEmptySample [
	^ '""""'
]

{ #category : #sample }
PillarSnippetFactory >> boldFormatSample [
	^ '""Foo""'
]

{ #category : #sample }
PillarSnippetFactory >> boldFormatWithEscapedSample [
	^ '""\"\"""'
]

{ #category : #'tests - Script' }
PillarSnippetFactory >> codeBlockSample [
	^ '[[[
foo
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> commentedLineSample [
	^ '%some text'
]

{ #category : #sample }
PillarSnippetFactory >> commentedLineWithNewlineSample [
	^ '%some text
'
]

{ #category : #sample }
PillarSnippetFactory >> definitionListSample [
	^ ';Foo
:Bar'
]

{ #category : #sample }
PillarSnippetFactory >> emptyParagraphSample [
	^ '
'
]

{ #category : #sample }
PillarSnippetFactory >> escapedCharacterSample [

	^  '\*' 
]

{ #category : #sample }
PillarSnippetFactory >> figureFollowedByLinkWithAliasSample [
	^ '+file://TeapotWelcome.png+*Go>http://localhost*'
]

{ #category : #sample }
PillarSnippetFactory >> formatWithLinkSample [
	^ '""*foo*""'
]

{ #category : #sample }
PillarSnippetFactory >> headerEmptySample [
	^ '!'
]

{ #category : #sample }
PillarSnippetFactory >> headerLevel1Sample [
	^ '!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> headerLevel2Sample [
	^ '!!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> headerLevel3Sample [
	^ '!!!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> headerLevel4Sample [
	^ '!!!!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> headerLevel5Sample [
	^ '!!!!!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> headerLevel6Sample [
	^ '!!!!!!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> headerWithFormatAndTextSample [
	^ '!""Foo"" bar'
]

{ #category : #sample }
PillarSnippetFactory >> headerWithFormatSample [
	^ '!""Foo""'
]

{ #category : #sample }
PillarSnippetFactory >> headerWithNewLineSample [
	^ '!Foo
'
]

{ #category : #sample }
PillarSnippetFactory >> headerWithWithLinkSample [
	^ '! Foo *Link*'
]

{ #category : #sample }
PillarSnippetFactory >> horizontalRuleFollowByNewLineSample [
	^ '_
'
]

{ #category : #sample }
PillarSnippetFactory >> horizontalRuleSample [
	^ '_'
]

{ #category : #sample }
PillarSnippetFactory >> horizontalRuleTrimRightSample [
	^ '_  '
]

{ #category : #sample }
PillarSnippetFactory >> italicFormatEmptySample [
	^ '''''''''' 
]

{ #category : #sample }
PillarSnippetFactory >> italicFormatSample [
	^ '''''Foo''''' 
]

{ #category : #sample }
PillarSnippetFactory >> italicFormatWithEscapedSample [
	^   '''''\''\''''''' 
]

{ #category : #sample }
PillarSnippetFactory >> lineEndSample [

	^  ''
]

{ #category : #sample }
PillarSnippetFactory >> lineEndwithNewlineSample [

	^ String lf
]

{ #category : #sample }
PillarSnippetFactory >> linkFollowedByFigureWithAliasSample [
	^ '*http://localhost*+Go>file://TeapotWelcome.png+'
]

{ #category : #sample }
PillarSnippetFactory >> listMultiSample [
	^ '-1
--2
---3
--4
--5
--6
-7
-##8'
]

{ #category : #sample }
PillarSnippetFactory >> listWithCommentSample [
	^ '#Foo
%Comment
#Bar'
]

{ #category : #sample }
PillarSnippetFactory >> monospaceFormatEmptySample [
	^ '===='
]

{ #category : #sample }
PillarSnippetFactory >> monospaceFormatSample [
	^ '==Foo=='
]

{ #category : #sample }
PillarSnippetFactory >> monospaceFormatWithEscapedSample [
	^ '==\=\==='
]

{ #category : #sample }
PillarSnippetFactory >> newlineCRLFSample [

	^ String crlf
]

{ #category : #sample }
PillarSnippetFactory >> newlineCRSample [

	^ String cr
]

{ #category : #sample }
PillarSnippetFactory >> newlineLFSample [

	^ String lf
]

{ #category : #sample }
PillarSnippetFactory >> newlineSample [

	^ Smalltalk os lineEnding
]

{ #category : #sample }
PillarSnippetFactory >> orderedListEmptySample [
	^ '#'
]

{ #category : #sample }
PillarSnippetFactory >> orderedListMultiSample [
	^ '#1
##2
###3
##4
##5
##6
#7
###8'
]

{ #category : #sample }
PillarSnippetFactory >> orderedListSample [
	^ '#Foo'
]

{ #category : #sample }
PillarSnippetFactory >> orderedListWithSubListSample [
	^ '#Foo
##Bar'
]

{ #category : #sample }
PillarSnippetFactory >> orderedListWithTwoItemsSample [
	^ '#Foo
#Bar'
]

{ #category : #sample }
PillarSnippetFactory >> paragraphSample [
	^ 'This is a text'
]

{ #category : #sample }
PillarSnippetFactory >> paragraphWithFormatSample [
	^ 'Foo ""Bar""'
]

{ #category : #sample }
PillarSnippetFactory >> parameterFigureSample [
	^'value=foo'
]

{ #category : #sample }
PillarSnippetFactory >> parameterKeyUntilNewlineSample [
	^ 'parameterName'
]

{ #category : #sample }
PillarSnippetFactory >> parameterLinkSample [
	^  'value=foo' 
]

{ #category : #sample }
PillarSnippetFactory >> parameterUntilNewlineSample [
	^ 'foo=bar'
]

{ #category : #sample }
PillarSnippetFactory >> parameterValueUntilNewlineSample [
	^ '=parameterValue'
]

{ #category : #sample }
PillarSnippetFactory >> parametersFigureSample [
	^ '|foo=bar|timo=leon' 
]

{ #category : #sample }
PillarSnippetFactory >> parametersLinkSample [
	^ '|foo=bar|timo=leon'
]

{ #category : #sample }
PillarSnippetFactory >> parametersUntilNewlineSample [
	^ 'foo=bar|baz=true'
]

{ #category : #sample }
PillarSnippetFactory >> preformatedLineSample [
	^ '= Foo' 
]

{ #category : #sample }
PillarSnippetFactory >> preformatedTextEmptySample [
	^  '= ' 
]

{ #category : #sample }
PillarSnippetFactory >> preformatedTextSample [
	^  '= Foo' 
]

{ #category : #sample }
PillarSnippetFactory >> preformatedTextWithMultiLinesSample [
	^ '= Foo
= Bar'
		
]

{ #category : #sample }
PillarSnippetFactory >> preformatedTextWithNewlineSample [
^ '= Foo
' 
]

{ #category : #sample }
PillarSnippetFactory >> preformatedTextWithSpacesSample [
	^ '=    Foo'
]

{ #category : #sample }
PillarSnippetFactory >> preformatedTextWithTabSample [
	^ '= 	Foo' 
]

{ #category : #sample }
PillarSnippetFactory >> rawEmptySample [
	^ '{{{}}}'
]

{ #category : #sample }
PillarSnippetFactory >> rawHTMLSample [
	^ '{{{html:foo}}}' 
]

{ #category : #sample }
PillarSnippetFactory >> rawInvalidSample [
	^  '{{{invalid:foo}}}'
]

{ #category : #sample }
PillarSnippetFactory >> rawMultiLinesSample [
	^ '{{{foo
bar}}}'
]

{ #category : #sample }
PillarSnippetFactory >> rawSample [
	^ '{{{mock:foo}}}'
]

{ #category : #sample }
PillarSnippetFactory >> referenceFigureEscapeSample [
	^ 'file://foo\+.png'
]

{ #category : #sample }
PillarSnippetFactory >> referenceFigureSample [
	^ 'file://foo.png'
]

{ #category : #sample }
PillarSnippetFactory >> referenceLinkEscapeSample [
	^ 'file://foo\*.png'
]

{ #category : #sample }
PillarSnippetFactory >> referenceLinkSample [
	^ 'file://foo.png'
]

{ #category : #sample }
PillarSnippetFactory >> referenceSample [
	^ '*foo>@bar*'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterEndsWithSpaceSample [
	^ '[[[foo
bar
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterEscapeSample [
	^ 'value\==foo'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterSample [
	^ 'value=foo'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterTrueByDefaultSample [
	^ '[[[foo
bar
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterValueSample [
	^ '=foo'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterWithFloatSample [
	^ '[[[ratio=0.8
bar
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterWithLiteralArraySample [
	^ '[[[foo=#(1 2 true)
bar
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterWithNoValuesSample [
	^ '[[[foo=
bar
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterWithSpacesBeforeAndAfterSample [
	^ ' foo = true | bar = 2 
'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParameterWithoutValueSample [
	^ 'foo'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParametersEscapeSample [
	^ 'value=foo\||bar
'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParametersMultipleSample [
	^ 'value=foo|bar
'
]

{ #category : #sample }
PillarSnippetFactory >> scriptParametersSample [
	^ 'value=foo
'
]

{ #category : #sample }
PillarSnippetFactory >> scriptSample [
	^ '[[[
foo
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> scriptTwoParametersNoValueSample [
	^ 'foo|bar
'
]

{ #category : #sample }
PillarSnippetFactory >> scriptWithLanguageSample [
	^ '[[[language=smalltalk
foo
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> scriptWithNewLineSample [
	^ '[[[
foo
]]]
'
]

{ #category : #sample }
PillarSnippetFactory >> scriptWithSpaceAtTheEndSample [
	^ '[[[
foo
]]]  '
]

{ #category : #sample }
PillarSnippetFactory >> scriptWithSpacedParametersSample [
	^ '[[[ foo = true | bar = 2 
bla
]]]'
]

{ #category : #sample }
PillarSnippetFactory >> strikethroughFormatEmptySample [
	^ '----'
]

{ #category : #sample }
PillarSnippetFactory >> strikethroughFormatSample [
	^ '--Foo--'
]

{ #category : #sample }
PillarSnippetFactory >> strikethroughFormatWithEscapedSample [
	^ '--\-\---'
]

{ #category : #sample }
PillarSnippetFactory >> subscriptFormatEmptySample [
	^ '@@@@'
]

{ #category : #sample }
PillarSnippetFactory >> subscriptFormatSample [
	^ '@@Foo@@'
]

{ #category : #sample }
PillarSnippetFactory >> subscriptFormatWithEscapedSample [
	^ '@@\@\@@@'
]

{ #category : #sample }
PillarSnippetFactory >> superscriptFormatEmptySample [
	^ '^^^^'
]

{ #category : #sample }
PillarSnippetFactory >> superscriptFormatSample [
	^ '^^Foo^^'
]

{ #category : #sample }
PillarSnippetFactory >> superscriptFormatWithEscapedSample [
	^ '^^\^\^^^'
]

{ #category : #sample }
PillarSnippetFactory >> tableAlignMarkupSample [
	^ '}'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellAreTrimedSample [
	^ '|   Foo   '
]

{ #category : #sample }
PillarSnippetFactory >> tableCellCenterSample [
	^ '||Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellHeaderCenter2Sample [
	^ '||!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellHeaderCenterSample [
	^ '|!|Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellHeaderLeft2Sample [
	^ '|{!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellHeaderLeftSample [
	^ '|!{Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellHeaderRight2Sample [
	^ '|}!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellHeaderRightSample [
	^ '|!}Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellHeaderSample [
	^ '|!Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellLeftSample [
	^ '|{Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellRightSample [
	^ '|}Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellSample [
	^ '|Foo'
]

{ #category : #sample }
PillarSnippetFactory >> tableCellWithFormatSample [
	^ '| ''''Foo'''' ' 
]

{ #category : #sample }
PillarSnippetFactory >> tableCenterMarkupSample [
	^ '|'
]

{ #category : #sample }
PillarSnippetFactory >> tableHeadingMarkupSample [
	^ '!'
]

{ #category : #sample }
PillarSnippetFactory >> tableLeftMarkupSample [
	^ '{'
]

{ #category : #sample }
PillarSnippetFactory >> tableMarkupsCenterSample [
	^ '||'
]

{ #category : #sample }
PillarSnippetFactory >> tableMarkupsHeadingAndCenter2Sample [
	^ '||!'
]

{ #category : #sample }
PillarSnippetFactory >> tableMarkupsHeadingAndCenterSample [
	^ '|!|'
]

{ #category : #sample }
PillarSnippetFactory >> tableMarkupsHeadingSample [
	^ '|!'
]

{ #category : #sample }
PillarSnippetFactory >> tableMarkupsSample [
	^ '|'
]

{ #category : #sample }
PillarSnippetFactory >> tableRightMarkupSample [
	^ '}'
]

{ #category : #sample }
PillarSnippetFactory >> tableRowSample [
	^ '| Foo | Bar'
]

{ #category : #sample }
PillarSnippetFactory >> tableRowWithEmptyCellsSample [
	^ '|  | '
]

{ #category : #sample }
PillarSnippetFactory >> tableRowWithHeadingSample [
	^ '|! Foo |! Bar'
]

{ #category : #sample }
PillarSnippetFactory >> tableSample [
	^ '|! Foo |! Bar
| Foo2 | Bar2'
]

{ #category : #sample }
PillarSnippetFactory >> tableWithNewLineSample [
	^ '|! Foo |! Bar
| Foo2 | Bar2
'
]

{ #category : #sample }
PillarSnippetFactory >> textSample [
	^ 'Foo'
]

{ #category : #sample }
PillarSnippetFactory >> textWithEscapeAtBeginningSample [
	^ '\*Foo'
]

{ #category : #sample }
PillarSnippetFactory >> textWithEscapeInTheMiddleSample [
	^ 'Foo \* Bar' 
]

{ #category : #sample }
PillarSnippetFactory >> textWithMultiEscapeSample [
	^ '\*Foo\*' 
]

{ #category : #sample }
PillarSnippetFactory >> undefinedAnnotationAsNodeSample [
	^ '${undefinedAnnotation}$'
]

{ #category : #sample }
PillarSnippetFactory >> undefinedAnnotationSample [
	^ '${undefinedAnnotation}$'
]

{ #category : #sample }
PillarSnippetFactory >> undefinedAnnotationWithParametersAsNodeSample [
	^ '${undefinedAnnotation:param1=a|param2=b}$'
]

{ #category : #sample }
PillarSnippetFactory >> undefinedAnnotationWithParametersSample [
	^ '${undefinedAnnotation:param1=a|param2=b}$'
]

{ #category : #sample }
PillarSnippetFactory >> underlineFormatEmptySample [
	^ '____'
]

{ #category : #sample }
PillarSnippetFactory >> underlineFormatSample [
	^ '__Foo__'
]

{ #category : #sample }
PillarSnippetFactory >> underlineFormatWithEscapedSample [
	^ '__\_\___'
]

{ #category : #sample }
PillarSnippetFactory >> unorderedListEmptySample [
	^ '-'
]

{ #category : #sample }
PillarSnippetFactory >> unorderedListMultiSample [
	^ '-1
--2
---3
--4
--5
--6
-7
---8'
]

{ #category : #sample }
PillarSnippetFactory >> unorderedListSample [
	^ '-Foo'
]

{ #category : #sample }
PillarSnippetFactory >> unorderedListWithSubListSample [
	^ '-Foo
--Bar'
]

{ #category : #sample }
PillarSnippetFactory >> unorderedListWithTwoItemsSample [
	^ '-Foo
-Bar'
]
