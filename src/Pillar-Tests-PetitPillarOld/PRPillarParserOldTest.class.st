Class {
	#name : #PRPillarParserOldTest,
	#superclass : #PRPillarGrammarOldTest,
	#category : 'Pillar-Tests-PetitPillarOld'
}

{ #category : #accessing }
PRPillarParserOldTest >> parserClass [
	^ PRPillarParserOld
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testAliasFigure [
	super testAliasFigure.
	self assert: result equals: { PRText content: 'Alias' }
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testAliasFigureEscape [
	super testAliasFigureEscape.
	self assert: result equals: { PRText content: 'Alias>' }
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testAliasLink [
	super testAliasLink.
	self assert: result equals: { PRText content: 'Alias' }
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testAliasLinkEscape [
	super testAliasLinkEscape.
	self assert: result equals: { PRText content: 'Alias>' }
]

{ #category : #'tests - Anchor' }
PRPillarParserOldTest >> testAnchor [
	super testAnchor.
	self assert: result equals: (PRAnchor named: 'test')
]

{ #category : #'tests - Anchor' }
PRPillarParserOldTest >> testAnchorAreTrimed [
	super testAnchorAreTrimed.
	self assert: result equals: (PRAnchor named: 'test')
]

{ #category : #'tests - Anchor' }
PRPillarParserOldTest >> testAnchorWithNewLine [
	super testAnchorWithNewLine.
	self assert: result equals: (PRAnchor named: 'foo')
]

{ #category : #'tests - Anchor' }
PRPillarParserOldTest >> testAnchorWithSpaceInside [
	super testAnchorWithSpaceInside.
	self assert: result equals: (PRAnchor named: 'foo bar')
]

{ #category : #'tests - Paragraph' }
PRPillarParserOldTest >> testAnnotatedParagraph [
	super testAnnotatedParagraph.
	self assert: result equals: (PRAnnotatedParagraph withAll: {PRText content: 'Bar'} annotation: 'foo')
]

{ #category : #'tests - Paragraph' }
PRPillarParserOldTest >> testAnnotatedParagraphEmpty [
	super testAnnotatedParagraphEmpty.
	self
		assert: result
		equals:
			(PRAnnotatedParagraph new
				annotation: 'foo';
				yourself)
]

{ #category : #'tests - Paragraph' }
PRPillarParserOldTest >> testAnnotatedParagraphEmptyWithNewLine [
	super testAnnotatedParagraphEmptyWithNewLine.
	self
		assert: result
		equals:
			(PRAnnotatedParagraph new
				annotation: 'foo';
				yourself)
]

{ #category : #'tests - Annotation' }
PRPillarParserOldTest >> testAnnotation [
	super testAnnotation.
	self
		assert: result
		equals: (PRInputFileAnnotation withParametersInCollection: 
						((OrderedDictionary new
						at: 'path' put: 'Foo';
						yourself)))
]

{ #category : #'tests - Annotation' }
PRPillarParserOldTest >> testAnnotationAreTrimedAtTheRight [
	super testAnnotationAreTrimedAtTheRight.
	self
		assert: result
		equals:
			(PRInputFileAnnotation
				withParametersInCollection:
					(OrderedDictionary new
						at: 'path' put: 'Foo';
						yourself))
]

{ #category : #'tests - Annotation' }
PRPillarParserOldTest >> testAnnotationParameter [
	super testAnnotationParameter.
	self assert: result equals: #('value' 'foo')
]

{ #category : #'tests - Annotation' }
PRPillarParserOldTest >> testAnnotationParameters [
	| expected |
	super testAnnotationParameters.
	expected := OrderedDictionary new.
	expected at: 'foo' put: 'bar'.
	expected at: 'timo' put: 'leon'.
	self assert: result equals:  expected
]

{ #category : #'tests - Annotation' }
PRPillarParserOldTest >> testAnnotationParameters2 [
	| expected |
	super testAnnotationParameters.
	expected := OrderedDictionary new.
	expected at: 'foo' put: 'bar'.
	expected at: 'timo' put: 'leon'.
	self assert: result equals:  expected
]

{ #category : #'tests - Annotation' }
PRPillarParserOldTest >> testAnnotationTag [
	super testAnnotationTag.
	self assert: result equals: PRMockAnnotation
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testBoldFormat [
	super testBoldFormat.
	self assert: result equals: (PRBoldFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testBoldFormatEmpty [
	super testBoldFormatEmpty.
	self assert: result equals: PRBoldFormat new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testBoldFormatWithEscaped [
	super testBoldFormatWithEscaped.
	self assert: result equals: (PRBoldFormat with: (PRText content: '""'))
]

{ #category : #'tests - Text' }
PRPillarParserOldTest >> testCommentedLine [
	super testCommentedLine.
	self assert: result equals: (PRCommentedLine content: 'some text')
]

{ #category : #'tests - Text' }
PRPillarParserOldTest >> testCommentedLineWithNewline [
	super testCommentedLineWithNewline.
	self assert: result equals: (PRCommentedLine content: 'some text')
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testDefinitionList [
	super testDefinitionList.
	self
		assert: result
		equals:
			(PRDefinitionList
				withAll:
					{(PRTermItem with: (PRText content: 'Foo')).
					(PRDataItem with: (PRText content: 'Bar'))})
]

{ #category : #'tests - Paragraph' }
PRPillarParserOldTest >> testEmptyParagraph [
	super testEmptyParagraph.
	self assert: result equals: PREmptyParagraph new
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testFigureFollowedByLinkWithAlias [
	| paragraph |
	super testFigureFollowedByLinkWithAlias.
	paragraph := PRParagraph withAll: { 
		PRFigure reference: 'file://TeapotWelcome.png'.
		(PRExternalLink reference: 'http://localhost')
			add: (PRText content: 'Go');
			yourself
	 }.
	self assert: result equals: paragraph
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testFormatWithLink [
	super testFormatWithLink.
	self assert: result equals: (PRBoldFormat with: (PRInternalLink reference: 'foo'))
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderEmpty [
	super testHeaderEmpty.
	self assert: result equals: (PRHeader withAll: Array new level: 1)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderLevel1 [
	super testHeaderLevel1.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 1)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderLevel2 [
	super testHeaderLevel2.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 2)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderLevel3 [
	super testHeaderLevel3.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 3)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderLevel4 [
	super testHeaderLevel4.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 4)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderLevel5 [
	super testHeaderLevel5.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 5)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderLevel6 [
	super testHeaderLevel6.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 6)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderWithFormat [
	super testHeaderWithFormat.
	self assert: result equals: (PRHeader withAll: {PRBoldFormat with: (PRText content: 'Foo')} level: 1)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderWithFormatAndText [
	super testHeaderWithFormatAndText.
	self
		assert: result
		equals:
			(PRHeader
				withAll:
					{PRBoldFormat with: (PRText content: 'Foo').
					PRText content: ' bar'}
				level: 1)
]

{ #category : #'tests - Header' }
PRPillarParserOldTest >> testHeaderWithNewLine [
	super testHeaderWithNewLine.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 1)
]

{ #category : #'tests - HorizontalRule' }
PRPillarParserOldTest >> testHorizontalRule [
	super testHorizontalRule.
	self assert: result equals: PRHorizontalRule new
]

{ #category : #'tests - HorizontalRule' }
PRPillarParserOldTest >> testHorizontalRuleFollowByNewLine [
	super testHorizontalRuleFollowByNewLine.
	self assert: result equals: PRHorizontalRule new
]

{ #category : #'tests - HorizontalRule' }
PRPillarParserOldTest >> testHorizontalRuleTrimRight [
	super testHorizontalRuleTrimRight.
	self assert: result equals: PRHorizontalRule new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testItalicFormat [
	super testItalicFormat.
	self assert: result equals: (PRItalicFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testItalicFormatEmpty [
	super testItalicFormatEmpty.
	self assert: result equals: PRItalicFormat new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testItalicFormatWithEscaped [
	super testItalicFormatWithEscaped.
	self assert: result equals: (PRItalicFormat with: (PRText content: ''''''))
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testLinkFollowedByFigureWithAlias [
	| paragraph |
	super testLinkFollowedByFigureWithAlias.
	paragraph := PRParagraph withAll: { 
		PRExternalLink reference: 'http://localhost'.
		(PRFigure reference: 'file://TeapotWelcome.png')
			add: (PRText content: 'Go');
			yourself
	 }.
	self assert: result equals: paragraph
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testListMulti [
	super testListMulti.
	self
		assert: result
		equals:
			(PRUnorderedList
				withAll:
					{(PRListItem
						withAll:
							{(PRText content: '1').
							(PRUnorderedList
								withAll:
									{(PRListItem
										withAll:
											{(PRText content: '2').
											(PRUnorderedList with: (PRListItem with: (PRText content: '3')))}).
									(PRListItem with: (PRText content: '4')).
									(PRListItem with: (PRText content: '5')).
									(PRListItem with: (PRText content: '6'))})}).
					(PRListItem
						withAll:
							{(PRText content: '7').
							(PROrderedList with: (PRListItem with: (PROrderedList with: (PRListItem with: (PRText content: '8')))))})})
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testListWithComment [
	super testListWithComment.
	self
		assert: result
		equals:
			(PROrderedList
				withAll:
					{PRListItem
						withAll:
							{PRText content: 'Foo'.
							PRCommentedLine content: 'Comment'}.
					PRListItem with: (PRText content: 'Bar')})
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testMonospaceFormat [
	super testMonospaceFormat.
	self assert: result equals: (PRMonospaceFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testMonospaceFormatEmpty [
	super testMonospaceFormatEmpty.
	self assert: result equals: PRMonospaceFormat new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testMonospaceFormatWithEscaped [
	super testMonospaceFormatWithEscaped.
	self assert: result equals: (PRMonospaceFormat with: (PRText content: '=='))
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testOrderedList [
	super testOrderedList.
	self assert: result equals: (PROrderedList with: (PRListItem with: (PRText content: 'Foo')))
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testOrderedListEmpty [
	super testOrderedListEmpty.
	self assert: result equals: (PROrderedList with: PRListItem new)
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testOrderedListMulti [
	super testOrderedListMulti.
	self
		assert: result
		equals:
			(PROrderedList
				withAll:
					{(PRListItem
						withAll:
							{(PRText content: '1').
							(PROrderedList
								withAll:
									{(PRListItem
										withAll:
											{(PRText content: '2').
											(PROrderedList with: (PRListItem with: (PRText content: '3')))}).
									(PRListItem with: (PRText content: '4')).
									(PRListItem with: (PRText content: '5')).
									(PRListItem with: (PRText content: '6'))})}).
					(PRListItem
						withAll:
							{(PRText content: '7').
							(PROrderedList with: (PRListItem with: (PROrderedList with: (PRListItem with: (PRText content: '8')))))})})
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testOrderedListWithSubList [
	super testOrderedListWithSubList.
	self
		assert: result
		equals:
			(PROrderedList
				with:
					(PRListItem
						withAll:
							{PRText content: 'Foo'.
							PROrderedList with: (PRListItem with: (PRText content: 'Bar'))}))
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testOrderedListWithTwoItems [
	super testOrderedListWithTwoItems.
	self
		assert: result
		equals:
			(PROrderedList
				withAll:
					{(PRListItem with: (PRText content: 'Foo')).
					(PRListItem with: (PRText content: 'Bar'))})
]

{ #category : #'tests - Paragraph' }
PRPillarParserOldTest >> testParagraph [
	super testParagraph.
	self assert: result equals: (PRParagraph new add: (PRText content: 'This is a text'))
]

{ #category : #'tests - Paragraph' }
PRPillarParserOldTest >> testParagraphWithFormat [
	super testParagraphWithFormat.
	self
		assert: result
		equals:
			(PRParagraph
				withAll:
					{(PRText content: 'Foo ').
					(PRBoldFormat with: (PRText content: 'Bar'))})
]

{ #category : #'tests - Text' }
PRPillarParserOldTest >> testRaw [
	super testRaw.
	self assert: result equals: (PRRaw content: 'foo' type: 'mock' )
]

{ #category : #'tests - Text' }
PRPillarParserOldTest >> testRawEmpty [
	super testRawEmpty.
	self assert: result equals: (PRRaw content: '')
]

{ #category : #'tests - Text' }
PRPillarParserOldTest >> testRawMultiLines [
	super testRawMultiLines.
	self assert: result equals: (PRRaw content: 'foo
bar')
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testReference [
	super testReference.
	self
		assert: result
		equals:
			(PRInternalLink new
				add: (PRText content: 'foo');
				anchor: 'bar';
				yourself)
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testReferenceFigure [
	super testReferenceFigure.
	self assert: result equals: 'file://foo.png'
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testReferenceFigureEscape [
	super testReferenceFigureEscape.
	self assert: result equals: 'file://foo+.png'
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testReferenceLink [
	super testReferenceLink.
	self assert: result equals: 'file://foo.png'
]

{ #category : #'tests - Reference' }
PRPillarParserOldTest >> testReferenceLinkEscape [
	super testReferenceLinkEscape.
	self assert: result equals: 'file://foo*.png'
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScript [
	super testScript.
	self assert: result equals: (PRCodeblock content: 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameter [
	super testScriptParameter.
	self assert: result equals: #('value' 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterEndsWithSpace [
	| script |
	super testScriptParameterTrueByDefault.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: true.
	self assert: result equals: script
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterEscape [
	super testScriptParameterEscape.
	self assert: result equals: #('value=' 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterTrueByDefault [
	| script |
	super testScriptParameterTrueByDefault.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: true.
	self assert: result equals: script
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterValue [
	super testScriptParameterValue.
	self assert: result equals: 'foo'
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterWithFloat [
	| script |
	super testScriptParameterWithFloat.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'ratio' put: 0.8.
	self assert: result equals: script
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterWithLiteralArray [
	| script |
	super testScriptParameterWithLiteralArray.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: #(1 2 true).
	self assert: result equals: script
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterWithNoValues [
	| script |
	super testScriptParameterWithNoValues.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: ''.
	self assert: result equals: script
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterWithSpacesBeforeAndAfter [
	super testScriptParameterWithSpacesBeforeAndAfter.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'foo' put: true;
				at: 'bar' put: 2;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameterWithoutValue [
	super testScriptParameterWithoutValue.
	self assert: result equals: #('foo'  nil)
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParameters [
	super testScriptParameters.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo';
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParametersEscape [
	super testScriptParametersEscape.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo|';
				at: 'bar' put: true;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptParametersMultiple [
	super testScriptParametersMultiple.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo';
				at: 'bar' put: true;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptTwoParametersNoValue [
	super testScriptTwoParametersNoValue.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'foo' put: true;
				at: 'bar' put: true;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptWithLanguage [
	super testScriptWithLanguage.
	self
		assert: result
		equals:
			((PRCodeblock content: 'foo')
				language: PRSmalltalkScriptLanguage default;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptWithNewLine [
	super testScriptWithNewLine.
	self assert: result equals: (PRCodeblock content: 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptWithSpaceAtTheEnd [
	super testScriptWithSpaceAtTheEnd.
	self assert: result equals: (PRCodeblock content: 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserOldTest >> testScriptWithSpacedParameters [
	super testScriptWithSpacedParameters.
	self assert: result equals: 
					(PRCodeblock content: 'bla'
									 parameters: (OrderedDictionary new 
															at: 'foo' put: true;
															at: 'bar' put: 2;
															yourself))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testStrikethroughFormat [
	super testStrikethroughFormat.
	self assert: result equals: (PRStrikethroughFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testStrikethroughFormatEmpty [
	super testStrikethroughFormatEmpty.
	self assert: result equals: PRStrikethroughFormat new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testStrikethroughFormatWithEscaped [
	super testStrikethroughFormatWithEscaped.
	self assert: result equals: (PRStrikethroughFormat with: (PRText content: '--'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testSubscriptFormat [
	super testSubscriptFormat.
	self assert: result equals: (PRSubscriptFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testSubscriptFormatEmpty [
	super testSubscriptFormatEmpty.
	self assert: result equals: PRSubscriptFormat new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testSubscriptFormatWithEscaped [
	super testSubscriptFormatWithEscaped.
	self assert: result equals: (PRSubscriptFormat with: (PRText content: '@@'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testSuperscriptFormat [
	super testSuperscriptFormat.
	self assert: result equals: (PRSuperscriptFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testSuperscriptFormatEmpty [
	super testSuperscriptFormatEmpty.
	self assert: result equals: PRSuperscriptFormat new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testSuperscriptFormatWithEscaped [
	super testSuperscriptFormatWithEscaped.
	self assert: result equals: (PRSuperscriptFormat with: (PRText content: '^^'))
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTable [
	super testTable.
	self
		assert: result
		equals:
			(PRTable new
				add:
						(PRTableRow new
								add: (PRTableCell align: nil heading: true withAll: {PRText content: 'Foo'});
								add: (PRTableCell align: nil heading: true withAll: {PRText content: 'Bar'});
								yourself);
				add:
						(PRTableRow new
								add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo2'});
								add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Bar2'});
								yourself);
				yourself)
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableAlignMarkup [
	super testTableAlignMarkup.
	self assert: result equals: #right
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCell [
	super testTableCell.
	self assert: result equals: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellAreTrimed [
	super testTableCellAreTrimed.
	self assert: result equals: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellCenter [
	super testTableCellCenter.
	self assert: result equals: (PRTableCell align: #center heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellHeader [
	super testTableCellHeader.
	self assert: result equals: (PRTableCell align: nil heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellHeaderCenter [
	super testTableCellHeaderCenter.
	self assert: result equals: (PRTableCell align: #center heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellHeaderCenter2 [
	super testTableCellHeaderCenter2.
	self assert: result equals: (PRTableCell align: #center heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellHeaderLeft [
	super testTableCellHeaderLeft.
	self assert: result equals: (PRTableCell align: #left heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellHeaderLeft2 [
	super testTableCellHeaderLeft2.
	self assert: result equals: (PRTableCell align: #left heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellHeaderRight [
	super testTableCellHeaderRight.
	self assert: result equals: (PRTableCell align: #right heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellHeaderRight2 [
	super testTableCellHeaderRight2.
	self assert: result equals: (PRTableCell align: #right heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellLeft [
	super testTableCellLeft.
	self assert: result equals: (PRTableCell align: #left heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellRight [
	super testTableCellRight.
	self assert: result equals: (PRTableCell align: #right heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCellWithFormat [
	super testTableCellWithFormat.
	self
		assert: result
		equals: (PRTableCell align: nil heading: false withAll: {PRItalicFormat with: (PRText content: 'Foo')})
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableCenterMarkup [
	super testTableCenterMarkup.
	self assert: result equals: #center
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableHeadingMarkup [
	super testTableHeadingMarkup.
	self assert: result equals: true
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableLeftMarkup [
	super testTableLeftMarkup.
	self assert: result equals: #left
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableMarkups [
	super testTableMarkups.
	self
		assert: result
		equals:
			{nil.
			false}
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableMarkupsCenter [
	super testTableMarkupsCenter.
	self
		assert: result
		equals:
			{#center.
			false}
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableMarkupsHeading [
	super testTableMarkupsHeading.
	self
		assert: result
		equals:
			{nil.
			true}
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableMarkupsHeadingAndCenter [
	super testTableMarkupsHeadingAndCenter.
	self
		assert: result
		equals:
			{#center.
			true}
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableMarkupsHeadingAndCenter2 [
	super testTableMarkupsHeadingAndCenter2.
	self
		assert: result
		equals:
			{#center.
			true}
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableRightMarkup [
	super testTableRightMarkup.
	self assert: result equals: #right
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableRow [
	super testTableRow.
	self
		assert: result
		equals:
			(PRTableRow new
				add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo'});
				add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Bar'});
				yourself)
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableRowWithEmptyCells [
	super testTableRowWithEmptyCells.
	self
		assert: result
		equals:
			(PRTableRow new
				add: PRTableCell new;
				add: PRTableCell new;
				yourself)
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableRowWithHeading [
	super testTableRowWithHeading.
	self
		assert: result
		equals:
			(PRTableRow new
				add: (PRTableCell align: nil heading: true withAll: {PRText content: 'Foo'});
				add: (PRTableCell align: nil heading: true withAll: {PRText content: 'Bar'});
				yourself)
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableWithComment [
	super testTableWithComment.
	self flag: #todo	"See super."
	"self
		assert: result
		equals:
			(PRTable
				withAll:
					{PRTableRow
						with:
							(PRTableCell
								align: nil
								heading: false
								withAll:
									{PRText content: 'Foo'.
									PRCommentedLine content: 'Comment'}).
					PRTableRow with: (PRTableCell align: nil heading: false withAll: {PRText content: 'Bar'})})"
]

{ #category : #'tests - Table' }
PRPillarParserOldTest >> testTableWithNewLine [
	super testTableWithNewLine.
	self
		assert: result
		equals:
			(PRTable new
				add:
						(PRTableRow new
								add: (PRTableCell align: nil heading: true withAll: {PRText content: 'Foo'});
								add: (PRTableCell align: nil heading: true withAll: {PRText content: 'Bar'});
								yourself);
				add:
						(PRTableRow new
								add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo2'});
								add: (PRTableCell align: nil heading: false withAll: {PRText content: 'Bar2'});
								yourself);
				yourself)
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testUnderlineFormat [
	super testUnderlineFormat.
	self assert: result equals: (PRUnderlineFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testUnderlineFormatEmpty [
	super testUnderlineFormatEmpty.
	self assert: result equals: PRUnderlineFormat new
]

{ #category : #'tests - Format' }
PRPillarParserOldTest >> testUnderlineFormatWithEscaped [
	super testUnderlineFormatWithEscaped.
	self assert: result equals: (PRUnderlineFormat with: (PRText content: '__'))
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testUnorderedList [
	super testUnorderedList.
	self
		assert: result
		equals: (PRUnorderedList with: (PRListItem with: (PRText content: 'Foo')))
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testUnorderedListEmpty [
	super testUnorderedListEmpty.
	self assert: result equals: (PRUnorderedList with: PRListItem new)
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testUnorderedListMulti [
	super testUnorderedListMulti.
	self
		assert: result
		equals:
			(PRUnorderedList
				withAll:
					{(PRListItem
						withAll:
							{(PRText content: '1').
							(PRUnorderedList
								withAll:
									{(PRListItem
										withAll:
											{(PRText content: '2').
											(PRUnorderedList with: (PRListItem with: (PRText content: '3')))}).
									(PRListItem with: (PRText content: '4')).
									(PRListItem with: (PRText content: '5')).
									(PRListItem with: (PRText content: '6'))})}).
					(PRListItem
						withAll:
							{(PRText content: '7').
							(PRUnorderedList
								with:
									(PRListItem with: (PRUnorderedList with: (PRListItem with: (PRText content: '8')))))})})
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testUnorderedListWithSubList [
	super testUnorderedListWithSubList.
	self
		assert: result
		equals:
			(PRUnorderedList
				with:
					(PRListItem
						withAll:
							{(PRText content: 'Foo').
							(PRUnorderedList with: (PRListItem with: (PRText content: 'Bar')))}))
]

{ #category : #'tests - List' }
PRPillarParserOldTest >> testUnorderedListWithTwoItems [
	super testUnorderedListWithTwoItems.
	self
		assert: result
		equals:
			(PRUnorderedList
				withAll:
					{(PRListItem with: (PRText content: 'Foo')).
					(PRListItem with: (PRText content: 'Bar'))})
]
