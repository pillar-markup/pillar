Class {
	#name : #PRPillarParserTest,
	#superclass : #PRPillarGrammarTest,
	#category : 'Pillar-Tests-PetitPillar'
}

{ #category : #accessing }
PRPillarParserTest >> parserClass [
	^ PRPillarParser
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testAliasFigure [
	super testAliasFigure.
	self assert: result equals: { PRText content: 'Alias' }
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testAliasFigureEscape [
	super testAliasFigureEscape.
	self assert: result equals: { PRText content: 'Alias>' }
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testAliasLink [
	super testAliasLink.
	self assert: result equals: { PRText content: 'Alias' }
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testAliasLinkEscape [
	super testAliasLinkEscape.
	self assert: result equals: { PRText content: 'Alias>' }
]

{ #category : #'tests - Anchor' }
PRPillarParserTest >> testAnchor [
	super testAnchor.
	self assert: result equals: (PRAnchor named: 'test')
]

{ #category : #'tests - Anchor' }
PRPillarParserTest >> testAnchorAreTrimed [
	super testAnchorAreTrimed.
	self assert: result equals: (PRAnchor named: 'test')
]

{ #category : #'tests - Anchor' }
PRPillarParserTest >> testAnchorWithNewLine [
	super testAnchorWithNewLine.
	self assert: result equals: (PRAnchor named: 'foo')
]

{ #category : #'tests - Anchor' }
PRPillarParserTest >> testAnchorWithSpaceInside [
	super testAnchorWithSpaceInside.
	self assert: result equals: (PRAnchor named: 'foo bar')
]

{ #category : #'tests - Paragraph' }
PRPillarParserTest >> testAnnotatedParagraph [
	super testAnnotatedParagraph.
	self assert: result equals: (PRAnnotatedParagraph withAll: {PRText content: 'Bar'} annotation: 'foo')
]

{ #category : #'tests - Paragraph' }
PRPillarParserTest >> testAnnotatedParagraphEmpty [
	super testAnnotatedParagraphEmpty.
	self
		assert: result
		equals:
			(PRAnnotatedParagraph new
				annotation: 'foo';
				yourself)
]

{ #category : #'tests - Paragraph' }
PRPillarParserTest >> testAnnotatedParagraphEmptyWithNewLine [
	super testAnnotatedParagraphEmptyWithNewLine.
	self
		assert: result
		equals:
			(PRAnnotatedParagraph new
				annotation: 'foo';
				yourself)
]

{ #category : #'tests - Annotation' }
PRPillarParserTest >> testAnnotation [
	super testAnnotation.
	self
		assert: result
		equals: (PRInputFileAnnotation withParameters: 
						((OrderedDictionary new
						at: 'value' put: 'Foo';
						yourself)))
]

{ #category : #'tests - Annotation' }
PRPillarParserTest >> testAnnotationAreTrimedAtTheRight [
	super testAnnotationAreTrimedAtTheRight.
	self
		assert: result
		equals:
			(PRInputFileAnnotation
				withParameters:
					(OrderedDictionary new
						at: 'value' put: 'Foo';
						yourself))
]

{ #category : #'tests - Annotation' }
PRPillarParserTest >> testAnnotationParameter [
	super testAnnotationParameter.
	self assert: result equals: #('value' 'foo')
]

{ #category : #'tests - Annotation' }
PRPillarParserTest >> testAnnotationParameters [
	| expected |
	super testAnnotationParameters.
	expected := OrderedDictionary new.
	expected at: 'foo' put: 'bar'.
	expected at: 'timo' put: 'leon'.
	self assert: result equals:  expected
]

{ #category : #'tests - Annotation' }
PRPillarParserTest >> testAnnotationParameters2 [
	| expected |
	super testAnnotationParameters.
	expected := OrderedDictionary new.
	expected at: 'foo' put: 'bar'.
	expected at: 'timo' put: 'leon'.
	self assert: result equals:  expected
]

{ #category : #'tests - Annotation' }
PRPillarParserTest >> testAnnotationTag [
	super testAnnotationTag.
	self assert: result equals: PRMockAnnotation
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testBoldFormat [
	super testBoldFormat.
	self assert: result equals: (PRBoldFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testBoldFormatEmpty [
	super testBoldFormatEmpty.
	self assert: result equals: PRBoldFormat new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testBoldFormatWithEscaped [
	super testBoldFormatWithEscaped.
	self assert: result equals: (PRBoldFormat with: (PRText content: '""'))
]

{ #category : #'tests - Text' }
PRPillarParserTest >> testCommentedLine [
	super testCommentedLine.
	self assert: result equals: (PRCommentedLine content: 'some text')
]

{ #category : #'tests - Text' }
PRPillarParserTest >> testCommentedLineWithNewline [
	super testCommentedLineWithNewline.
	self assert: result equals: (PRCommentedLine content: 'some text')
]

{ #category : #'tests - List' }
PRPillarParserTest >> testDefinitionList [
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
PRPillarParserTest >> testEmptyParagraph [
	super testEmptyParagraph.
	self assert: result equals: PREmptyParagraph new
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testFigureFollowedByLinkWithAlias [
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
PRPillarParserTest >> testFormatWithLink [
	super testFormatWithLink.
	self assert: result equals: (PRBoldFormat with: (PRInternalLink reference: 'foo'))
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderEmpty [
	super testHeaderEmpty.
	self assert: result equals: (PRHeader withAll: Array new level: 1)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderLevel1 [
	super testHeaderLevel1.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 1)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderLevel2 [
	super testHeaderLevel2.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 2)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderLevel3 [
	super testHeaderLevel3.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 3)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderLevel4 [
	super testHeaderLevel4.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 4)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderLevel5 [
	super testHeaderLevel5.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 5)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderLevel6 [
	super testHeaderLevel6.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 6)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderWithFormat [
	super testHeaderWithFormat.
	self assert: result equals: (PRHeader withAll: {PRBoldFormat with: (PRText content: 'Foo')} level: 1)
]

{ #category : #'tests - Header' }
PRPillarParserTest >> testHeaderWithFormatAndText [
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
PRPillarParserTest >> testHeaderWithNewLine [
	super testHeaderWithNewLine.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 1)
]

{ #category : #'tests - HorizontalRule' }
PRPillarParserTest >> testHorizontalRule [
	super testHorizontalRule.
	self assert: result equals: PRHorizontalRule new
]

{ #category : #'tests - HorizontalRule' }
PRPillarParserTest >> testHorizontalRuleFollowByNewLine [
	super testHorizontalRuleFollowByNewLine.
	self assert: result equals: PRHorizontalRule new
]

{ #category : #'tests - HorizontalRule' }
PRPillarParserTest >> testHorizontalRuleTrimRight [
	super testHorizontalRuleTrimRight.
	self assert: result equals: PRHorizontalRule new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testItalicFormat [
	super testItalicFormat.
	self assert: result equals: (PRItalicFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testItalicFormatEmpty [
	super testItalicFormatEmpty.
	self assert: result equals: PRItalicFormat new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testItalicFormatWithEscaped [
	super testItalicFormatWithEscaped.
	self assert: result equals: (PRItalicFormat with: (PRText content: ''''''))
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testLinkFollowedByFigureWithAlias [
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
PRPillarParserTest >> testListMulti [
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
PRPillarParserTest >> testListWithComment [
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
PRPillarParserTest >> testMonospaceFormat [
	super testMonospaceFormat.
	self assert: result equals: (PRMonospaceFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testMonospaceFormatEmpty [
	super testMonospaceFormatEmpty.
	self assert: result equals: PRMonospaceFormat new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testMonospaceFormatWithEscaped [
	super testMonospaceFormatWithEscaped.
	self assert: result equals: (PRMonospaceFormat with: (PRText content: '=='))
]

{ #category : #'tests - List' }
PRPillarParserTest >> testOrderedList [
	super testOrderedList.
	self assert: result equals: (PROrderedList with: (PRListItem with: (PRText content: 'Foo')))
]

{ #category : #'tests - List' }
PRPillarParserTest >> testOrderedListEmpty [
	super testOrderedListEmpty.
	self assert: result equals: (PROrderedList with: PRListItem new)
]

{ #category : #'tests - List' }
PRPillarParserTest >> testOrderedListMulti [
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
PRPillarParserTest >> testOrderedListWithSubList [
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
PRPillarParserTest >> testOrderedListWithTwoItems [
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
PRPillarParserTest >> testParagraph [
	super testParagraph.
	self assert: result equals: (PRParagraph new add: (PRText content: 'This is a text'))
]

{ #category : #'tests - Paragraph' }
PRPillarParserTest >> testParagraphWithFormat [
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
PRPillarParserTest >> testRaw [
	super testRaw.
	self assert: result equals: (PRRaw content: 'foo' type: 'mock' )
]

{ #category : #'tests - Text' }
PRPillarParserTest >> testRawEmpty [
	super testRawEmpty.
	self assert: result equals: (PRRaw content: '')
]

{ #category : #'tests - Text' }
PRPillarParserTest >> testRawMultiLines [
	super testRawMultiLines.
	self assert: result equals: (PRRaw content: 'foo
bar')
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testReference [
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
PRPillarParserTest >> testReferenceFigure [
	super testReferenceFigure.
	self assert: result equals: 'file://foo.png'
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testReferenceFigureEscape [
	super testReferenceFigureEscape.
	self assert: result equals: 'file://foo+.png'
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testReferenceLink [
	super testReferenceLink.
	self assert: result equals: 'file://foo.png'
]

{ #category : #'tests - Reference' }
PRPillarParserTest >> testReferenceLinkEscape [
	super testReferenceLinkEscape.
	self assert: result equals: 'file://foo*.png'
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScript [
	super testScript.
	self assert: result equals: (PRCodeblock content: 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParameter [
	super testScriptParameter.
	self assert: result equals: #('value' 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParameterEscape [
	super testScriptParameterEscape.
	self assert: result equals: #('value=' 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParameterNil [
	| script |
	super testScriptParameterNil.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: nil.
	self assert: result equals: script
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParameterValue [
	super testScriptParameterValue.
	self assert: result equals: 'foo'
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParameterWithNoValues [
	| script |
	super testScriptParameterWithNoValues.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: ''.
	self assert: result equals: script
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParameterWithoutValue [
	super testScriptParameterWithoutValue.
	self assert: result equals: #('foo'  nil)
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParameters [
	super testScriptParameters.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo';
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParametersEscape [
	super testScriptParametersEscape.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo|';
				at: 'bar' put: nil;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptParametersMultiple [
	super testScriptParametersMultiple.
	self
		assert: result
		equals:
			(OrderedDictionary new
				at: 'value' put: 'foo';
				at: 'bar' put: nil;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptWithLanguage [
	super testScriptWithLanguage.
	self
		assert: result
		equals:
			((PRCodeblock content: 'foo')
				language: PRSmalltalkScriptLanguage default;
				yourself)
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptWithNewLine [
	super testScriptWithNewLine.
	self assert: result equals: (PRCodeblock content: 'foo')
]

{ #category : #'tests - Script' }
PRPillarParserTest >> testScriptWithSpaceAtTheEnd [
	super testScriptWithSpaceAtTheEnd.
	self assert: result equals: (PRCodeblock content: 'foo')
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testStrikethroughFormat [
	super testStrikethroughFormat.
	self assert: result equals: (PRStrikethroughFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testStrikethroughFormatEmpty [
	super testStrikethroughFormatEmpty.
	self assert: result equals: PRStrikethroughFormat new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testStrikethroughFormatWithEscaped [
	super testStrikethroughFormatWithEscaped.
	self assert: result equals: (PRStrikethroughFormat with: (PRText content: '--'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testSubscriptFormat [
	super testSubscriptFormat.
	self assert: result equals: (PRSubscriptFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testSubscriptFormatEmpty [
	super testSubscriptFormatEmpty.
	self assert: result equals: PRSubscriptFormat new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testSubscriptFormatWithEscaped [
	super testSubscriptFormatWithEscaped.
	self assert: result equals: (PRSubscriptFormat with: (PRText content: '@@'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testSuperscriptFormat [
	super testSuperscriptFormat.
	self assert: result equals: (PRSuperscriptFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testSuperscriptFormatEmpty [
	super testSuperscriptFormatEmpty.
	self assert: result equals: PRSuperscriptFormat new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testSuperscriptFormatWithEscaped [
	super testSuperscriptFormatWithEscaped.
	self assert: result equals: (PRSuperscriptFormat with: (PRText content: '^^'))
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTable [
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
PRPillarParserTest >> testTableAlignMarkup [
	super testTableAlignMarkup.
	self assert: result equals: #right
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCell [
	super testTableCell.
	self assert: result equals: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellAreTrimed [
	super testTableCellAreTrimed.
	self assert: result equals: (PRTableCell align: nil heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellCenter [
	super testTableCellCenter.
	self assert: result equals: (PRTableCell align: #center heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellHeader [
	super testTableCellHeader.
	self assert: result equals: (PRTableCell align: nil heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellHeaderCenter [
	super testTableCellHeaderCenter.
	self assert: result equals: (PRTableCell align: #center heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellHeaderCenter2 [
	super testTableCellHeaderCenter2.
	self assert: result equals: (PRTableCell align: #center heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellHeaderLeft [
	super testTableCellHeaderLeft.
	self assert: result equals: (PRTableCell align: #left heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellHeaderLeft2 [
	super testTableCellHeaderLeft2.
	self assert: result equals: (PRTableCell align: #left heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellHeaderRight [
	super testTableCellHeaderRight.
	self assert: result equals: (PRTableCell align: #right heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellHeaderRight2 [
	super testTableCellHeaderRight2.
	self assert: result equals: (PRTableCell align: #right heading: true withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellLeft [
	super testTableCellLeft.
	self assert: result equals: (PRTableCell align: #left heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellRight [
	super testTableCellRight.
	self assert: result equals: (PRTableCell align: #right heading: false withAll: {PRText content: 'Foo'})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCellWithFormat [
	super testTableCellWithFormat.
	self
		assert: result
		equals: (PRTableCell align: nil heading: false withAll: {PRItalicFormat with: (PRText content: 'Foo')})
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableCenterMarkup [
	super testTableCenterMarkup.
	self assert: result equals: #center
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableHeadingMarkup [
	super testTableHeadingMarkup.
	self assert: result equals: true
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableLeftMarkup [
	super testTableLeftMarkup.
	self assert: result equals: #left
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableMarkups [
	super testTableMarkups.
	self
		assert: result
		equals:
			{nil.
			false}
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableMarkupsCenter [
	super testTableMarkupsCenter.
	self
		assert: result
		equals:
			{#center.
			false}
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableMarkupsHeading [
	super testTableMarkupsHeading.
	self
		assert: result
		equals:
			{nil.
			true}
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableMarkupsHeadingAndCenter [
	super testTableMarkupsHeadingAndCenter.
	self
		assert: result
		equals:
			{#center.
			true}
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableMarkupsHeadingAndCenter2 [
	super testTableMarkupsHeadingAndCenter2.
	self
		assert: result
		equals:
			{#center.
			true}
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableRightMarkup [
	super testTableRightMarkup.
	self assert: result equals: #right
]

{ #category : #'tests - Table' }
PRPillarParserTest >> testTableRow [
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
PRPillarParserTest >> testTableRowWithEmptyCells [
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
PRPillarParserTest >> testTableRowWithHeading [
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
PRPillarParserTest >> testTableWithComment [
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
PRPillarParserTest >> testTableWithNewLine [
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
PRPillarParserTest >> testUnderlineFormat [
	super testUnderlineFormat.
	self assert: result equals: (PRUnderlineFormat with: (PRText content: 'Foo'))
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testUnderlineFormatEmpty [
	super testUnderlineFormatEmpty.
	self assert: result equals: PRUnderlineFormat new
]

{ #category : #'tests - Format' }
PRPillarParserTest >> testUnderlineFormatWithEscaped [
	super testUnderlineFormatWithEscaped.
	self assert: result equals: (PRUnderlineFormat with: (PRText content: '__'))
]

{ #category : #'tests - List' }
PRPillarParserTest >> testUnorderedList [
	super testUnorderedList.
	self
		assert: result
		equals: (PRUnorderedList with: (PRListItem with: (PRText content: 'Foo')))
]

{ #category : #'tests - List' }
PRPillarParserTest >> testUnorderedListEmpty [
	super testUnorderedListEmpty.
	self assert: result equals: (PRUnorderedList with: PRListItem new)
]

{ #category : #'tests - List' }
PRPillarParserTest >> testUnorderedListMulti [
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
PRPillarParserTest >> testUnorderedListWithSubList [
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
PRPillarParserTest >> testUnorderedListWithTwoItems [
	super testUnorderedListWithTwoItems.
	self
		assert: result
		equals:
			(PRUnorderedList
				withAll:
					{(PRListItem with: (PRText content: 'Foo')).
					(PRListItem with: (PRText content: 'Bar'))})
]
