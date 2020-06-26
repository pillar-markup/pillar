"
I provide abstract tests and helper methods to test the subclasses of PRDocumentWriter.
"
Class {
	#name : #PRDocumentWriterTest,
	#superclass : #PRVisitorTest,
	#instVars : [
		'configuration'
	],
	#category : #'Pillar-Tests-ExporterCore-LevelPrinter'
}

{ #category : #testing }
PRDocumentWriterTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #PRDocumentWriterTest
]

{ #category : #private }
PRDocumentWriterTest >> actualClass [
	^ PRDocumentWriter
]

{ #category : #private }
PRDocumentWriterTest >> actualInstance [
	^  self createWriterOn: String new
]

{ #category : #tests }
PRDocumentWriterTest >> annotation [
	
	^ self shouldBeImplemented.  
]

{ #category : #asserting }
PRDocumentWriterTest >> assert: result includesSubstring: expected [
	expected ifEmpty: [ ^ self ].
	self assert: (result includesSubstring: expected) description: ('''{1}'' not in ''{2}''' format: {expected . result})
]

{ #category : #asserting }
PRDocumentWriterTest >> assertWriting: aDocumentItem includesText: aString [
	| result |
	result := self write: aDocumentItem.
	self assert: result includesSubstring: aString
]

{ #category : #asserting }
PRDocumentWriterTest >> assertWriting: aDocumentItem includesTexts: aCollection [
	| resultString |
	resultString := self write: aDocumentItem.
	aCollection do: [ :testString | self assert: resultString includesSubstring: testString ]
]

{ #category : #requirements }
PRDocumentWriterTest >> boldFoo [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRDocumentWriterTest >> configuration [
	^ configuration ifNil: [ configuration := self configurationClass new ]
]

{ #category : #helpers }
PRDocumentWriterTest >> configurationClass [
	^ ConfigurationForPillar
]

{ #category : #helpers }
PRDocumentWriterTest >> createWriterOn: aWriteStream [ 
	^ (self actualClass on: aWriteStream)
		configuration: self configuration;
		yourself
]

{ #category : #helpers }
PRDocumentWriterTest >> createWriterWithSeparateOutputFilesOn: aWriteStream [
	^ (self actualClass on: aWriteStream)
		configuration:
				(self configurationClass new
						separateOutputFiles: true;
						yourself);
		yourself
]

{ #category : #requirements }
PRDocumentWriterTest >> dataItemWithBar [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> definitionListBegin [
	self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> emailToFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> figureAnchorForPierLogo [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest >> figureBegin [
	^ self subclassResponsibility
]

{ #category : #data }
PRDocumentWriterTest >> foo [
	^ 'foo'
]

{ #category : #requirements }
PRDocumentWriterTest >> footnoteBar [
	^ ''
]

{ #category : #requirements }
PRDocumentWriterTest >> horizontalRule [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> italicFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> level1HeaderBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> level1HeaderWithFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> level2HeaderBegin [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest >> listItemWith1 [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> monospaceFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> orderedListBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> packageNamesUnderTest [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> paragraphFoo [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRDocumentWriterTest >> parser [
	^ PRPillarParserMain
]

{ #category : #requirements }
PRDocumentWriterTest >> preformattedFooBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> preformattedTextFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> rawText [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> referenceToFigurePierLogo [
	^ self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithRefWithAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithRefWithoutAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithRefWithoutAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest >> resultWithoutRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> scriptAnchorForMyScript [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> scriptWithCaptionBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> scriptWithoutCaptionBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> strikethroughFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> subscriptFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> superscriptFoo [
	^ self subclassResponsibility
]

{ #category : #tests }
PRDocumentWriterTest >> supportSyntaxHighlighting [
	^ true
]

{ #category : #requirements }
PRDocumentWriterTest >> tableBegin [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest >> tableCellWithFoo [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest >> tableCellWithHeadingFoo [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest >> tableRow [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest >> termItemWithFoo [
	^ self subclassResponsibility
]

{ #category : #tests }
PRDocumentWriterTest >> testAnnotation [
	| item |
	{ 'note' . 'dothis' } do:
	[	:annotation |	
		item := PRAnnotatedParagraph new
			annotation: annotation;
			add: (PRText content: 'foo');
			yourself.
		self 
			assertWriting: item
			includesTexts: 
				{self annotationBegin: annotation . 'foo'}. 
	].
]

{ #category : #tests }
PRDocumentWriterTest >> testBibFileIsCorrectlyTransformed [
	
	"Here we see that the configuration is holding a real object so taking its value blindly and pasting it in the template will not work."
	self assert: self configuration bibFile pathString equals: 'book.bib'.

	
	"the following test shows how the value of configuration is correctly transformed into a string that can be 
	used in a Mustache template."
	self assert: ((MustacheToken new token: 'bibFile') valueInContext: self configuration) equals: 'book.bib'
]

{ #category : #tests }
PRDocumentWriterTest >> testBoldFormat [
	| item |
	item := self addText: 'foo' to: PRBoldFormat new.
	self
		assertWriting: item
		includesTexts:
			{self boldFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testCommentedLineNotVisibleInOutput [
	| item result |
	item := PRCommentedLine content: 'some comment'.
	result := self write: item.
	self assertEmpty: result
]

{ #category : #tests }
PRDocumentWriterTest >> testConsecutiveTextsInAParagraphAreSeparatedByWhitespace [
	| item |
	item := PRParagraph new
		add: (PRText content: 'foo');
		add: (PRLineBreak new);
		add: (PRText content: 'bar');
		yourself.
	self assertWriting: item includesText: 'foo', self configuration newLine, 'bar'
]

{ #category : #tests }
PRDocumentWriterTest >> testDefinitionList [
	| item |
	item := PRDefinitionList new
		add: (self addText: 'foo' to: PRTermItem new);
		add: (self addText: 'bar' to: PRDataItem new);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{self definitionListBegin.
			self termItemWithFoo.
			self dataItemWithBar}
]

{ #category : #tests }
PRDocumentWriterTest >> testFigure [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	self
		assertWriting: item
		includesText:
			'picture.png'
]

{ #category : #tests }
PRDocumentWriterTest >> testFigureLabelGenerateAnchor [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'label' put: 'pierLogo';
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self figureAnchorForPierLogo).
			'pierLogo'}
]

{ #category : #tests }
PRDocumentWriterTest >> testFigureReference [
	| item resultString indexOfReference referenceString |
	item := PRParagraph new
		add:
				(PRFigure new
						reference: 'file://picture.png';
						parameterAt: 'label' put: 'pierLogo';
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 2 );
						yourself);
		add: (PRText content: 'See figure ');
		add: ((PRInternalLink reference: '@pierLogo') counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 2 ));
		yourself.
		resultString := self write: item.
	indexOfReference := resultString indexOfSubCollection: 'See figure ' startingAt: 1 ifAbsent: [ self fail: 'The string ''See figure '' should have been found' ].
	referenceString := resultString allButFirst: indexOfReference - 1.
	self assert: referenceString includesSubstring: self referenceToFigurePierLogo
]

{ #category : #tests }
PRDocumentWriterTest >> testFigureWithLabelAndWithCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		label: 'label';
		yourself.
	self assertWriting: item includesText: self figureBegin
]

{ #category : #tests }
PRDocumentWriterTest >> testFigureWithLabelAndWithoutCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		label: 'label';
		yourself.
	self assertWriting: item includesText: self figureBegin
]

{ #category : #tests }
PRDocumentWriterTest >> testFigureWithWidth [
	| item width |
	width := '50'.
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'width' put: width;
		yourself.
	self assertWriting: item includesText: self widthFor50percents
]

{ #category : #tests }
PRDocumentWriterTest >> testFigureWithoutLabelAndWithCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		yourself.
	self assertWriting: item includesText: self figureBegin
]

{ #category : #tests }
PRDocumentWriterTest >> testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment [
	| item result |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	result := self write: item.
	self figureBegin ifNotEmpty: [ self deny: (result includesSubstring: self figureBegin) ]
]

{ #category : #tests }
PRDocumentWriterTest >> testFiguresHaveACaption [
	| item caption filename |
	caption := 'A description'.
	filename := 'picture.png'.
	item := PRFigure new
		reference: 'file://' , filename;
		label: 'picture';
		add: (PRText content: caption);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self figureBegin).
			filename.
			caption}
]

{ #category : #tests }
PRDocumentWriterTest >> testFileExtension [
	| fileExtension |
	fileExtension := self instance fileExtension.
	self assert: fileExtension isNotNil.
	self assert: fileExtension isString
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest >> testFootnote [
	| item |
	item := PRParagraph new
		add: (PRText content: 'timo');
		add: (PRFootnote noted: 'Bar');
		add: (PRText content: 'leon');
		yourself.
	self assertWriting: item includesText: self footnoteBar
]

{ #category : #tests }
PRDocumentWriterTest >> testHasName [
	self denyEmpty: self actualClass writerName
]

{ #category : #tests }
PRDocumentWriterTest >> testHeader [
	| item |
	item := PRHeader new
		level: 1;
		add: (PRText content: 'foo');
		yourself.
	self assertWriting: item includesTexts: {self level1HeaderWithFoo}.
]

{ #category : #tests }
PRDocumentWriterTest >> testHorizontalRule [
	| item  |
	item := PRHorizontalRule new.
	self assertWriting: item includesText: self horizontalRule
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest >> testInternalLinkWithAliasWithRefWithAncorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithoutAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest >> testInternalLinkWithAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithoutRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutRefWithAnchorWithSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest >> testInternalLinkWithoutAliasWithRefWithAncorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar@foo');
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithSeparateOutputFiles) ]
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar');
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithoutAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithSeparateOutputFiles) ]
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest >> testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles) ]
]

{ #category : #tests }
PRDocumentWriterTest >> testItalicFormat [
	| item |
	item := self addText: 'foo' to: PRItalicFormat new.
	self
		assertWriting: item
		includesTexts:
			{self italicFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testLanguageForScript [
	| item smalltalk writer http |
	writer := self instance.
	item := PRCodeblock content: 'foo'.
	
	self assert: (writer languageForScript: item) class equals: PRUnspecifiedScriptLanguage. 
	
	
	smalltalk := PRSmalltalkScriptLanguage new.
	self configuration defaultScriptLanguage: smalltalk.
	self assert: (writer languageForScript: item) equals: smalltalk.
	
	http := PRHTTPScriptLanguage new.
	item := (PRCodeblock content: 'foo') language: http.
	self assert: (writer languageForScript: item) equals: http
]

{ #category : #tests }
PRDocumentWriterTest >> testLanguageForScript2 [
	"This test documents how to map values to script languages"
	
	self assert: (PRRealScriptLanguage for: nil) class equals: PRUnspecifiedScriptLanguage.
	self assert: (PRRealScriptLanguage for: 'nil') class equals:  PRUnsupportedScriptLanguage.
	self assert: (PRRealScriptLanguage for: '') class equals:  PRUnsupportedScriptLanguage.
	self assert: (PRRealScriptLanguage for: 'smalltalk') class equals:  PRSmalltalkScriptLanguage.
]

{ #category : #tests }
PRDocumentWriterTest >> testMailLink [
	| item |
	configuration propertyAt: #scrambledEmailAddresses put: false.
	item := self addText: 'Foo Bar' to: (PRMailLink reference: 'foo@bar.com').
	self
		assertWriting: item
		includesTexts:
			{self emailToFoo . 'Foo Bar'}
]

{ #category : #tests }
PRDocumentWriterTest >> testMarkupType [
	| markupType |
	markupType := self instance markupType.
	self assert: markupType isNotNil.
	self assert: markupType isSymbol
]

{ #category : #tests }
PRDocumentWriterTest >> testMonospaceFormat [
	| item |
	item := self addText: 'foo' to: PRMonospaceFormat new.
	self
		assertWriting: item
		includesTexts:
			{self monospaceFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testOrderedList [
	| item |
	item := PROrderedList new
		add: (self addText: '1' to: PRListItem new);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self orderedListBegin).
			(self listItemWith1)}
]

{ #category : #tests }
PRDocumentWriterTest >> testParagraph [
	| item |
	item := self addText: 'foo' to: PRParagraph new.
	self assertWriting: item includesText: self paragraphFoo
]

{ #category : #tests }
PRDocumentWriterTest >> testPreformatted [
	| item |
	item := self addText: 'foo' to: PRPreformatted new.
	self assertWriting: item includesTexts: {self preformattedFooBegin . self preformattedTextFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testPreformattedWithMultipleLines [
	| item |
	item := PRPreformatted new
		add: (PRText content: 'foo');
		add: (PRText content: 'bar');
		yourself.
	self assertWriting: item includesText: 'foo' , self configuration newLine
]

{ #category : #tests }
PRDocumentWriterTest >> testRaw [
	| item |
	item := PRRaw content: self rawText.
	self
		assertWriting: item
		includesText:
			self rawText
]

{ #category : #tests }
PRDocumentWriterTest >> testScript [
	| item |
	item := PRCodeblock content: 'foo'.
	self assertWriting: item includesTexts: {self scriptWithoutCaptionBegin . self foo}
]

{ #category : #tests }
PRDocumentWriterTest >> testScriptDefaultLanguage [
	| item |
	self supportSyntaxHighlighting
		ifFalse: [ self skip ].
	item := PRCodeblock content: 'foo'.
	configuration defaultScriptLanguage: PRHTMLScriptLanguage default.
	self assertWriting: item includesTexts: {PRHTMLScriptLanguage standardName}
]

{ #category : #tests }
PRDocumentWriterTest >> testScriptLabelGenerateAnchor [
	| item |
	item := (PRCodeblock content: 'foo')
		label: 'myScript';
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self scriptAnchorForMyScript).
			'myScript'}
]

{ #category : #tests }
PRDocumentWriterTest >> testScriptLanguage [
	| item |
	self supportSyntaxHighlighting ifFalse: [ self skip ].
	item := (PRCodeblock content: 'foo')
		language: 'html';
		yourself.
	self assertWriting: item includesTexts: {(PRHTMLScriptLanguage standardName)}
]

{ #category : #tests }
PRDocumentWriterTest >> testScriptWithFormattedCaption [
	| item |
	item := (PRCodeblock content: 'bar')
		caption: '""foo""';
		yourself.
	self assertWriting: item includesText: self boldFoo
]

{ #category : #tests }
PRDocumentWriterTest >> testScriptWithProblematicEval [
	| item nonExistingMethod |
	nonExistingMethod := 'FooBarDoesNotExistX'.
	item := (PRCodeblock content: 'Object ' , nonExistingMethod)
		eval: true;
		yourself.
	self assert: item isEvaluated.
	self assertWriting: item includesText: nonExistingMethod
]

{ #category : #tests }
PRDocumentWriterTest >> testScriptsHaveACaption [
	| item caption |
	caption := 'A description'.
	item := (PRCodeblock content: 'foo')
		caption:  caption;
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self scriptWithCaptionBegin).
			caption}
]

{ #category : #tests }
PRDocumentWriterTest >> testSpecifyPackageNamesUnderTest [
	self assert: self packageNamesUnderTest isCollection.
	self denyEmpty: self packageNamesUnderTest.
	self packageNamesUnderTest do: [ :packageName | self denyEmpty: (RPackage organizer packageNamed: packageName) methods ]
]

{ #category : #tests }
PRDocumentWriterTest >> testStrikethroughFormat [
	| item |
	item := self addText: 'foo' to: PRStrikethroughFormat new.
	self
		assertWriting: item
		includesTexts:
			{self strikethroughFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testSubscriptFormat [
	| item |
	item := self addText: 'foo' to: PRSubscriptFormat new.
	self
		assertWriting: item
		includesTexts:
			{self subscriptFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testSuperscriptFormat [
	| item |
	item := self addText: 'foo' to: PRSuperscriptFormat new.
	self
		assertWriting: item
		includesTexts:
			{self superscriptFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testTable [
	| item |
	item := PRTable new
		add:
				(PRTableRow new
						add: (self addText: 'foo' to: PRTableCell new);
						yourself);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self tableBegin).
			(self tableRow).
			(self tableCellWithFoo)}
]

{ #category : #tests }
PRDocumentWriterTest >> testTableWith2CellsInARow [
	| item |
	item := PRTable new
		add:
				(PRTableRow new
						add: (self addText: 'foo' to: PRTableCell new);
						add: (self addText: 'foo' to: PRTableCell new);
						yourself);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self tableBegin).
			(self tableRow).
			(self tableCellWithFoo)}.
	^ item
]

{ #category : #tests }
PRDocumentWriterTest >> testTableWithHeading [
	| item |
	item := PRTable new
		add:
				(PRTableRow new
						add:
								(self
										addText: 'foo'
										to:
											(PRTableCell new
												beHeading;
												yourself));
						yourself);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self tableBegin).
			(self tableRow).
			(self tableCellWithHeadingFoo)}
]

{ #category : #tests }
PRDocumentWriterTest >> testUnderlineFormat [
	| item |
	item := self addText: 'foo' to: PRUnderlineFormat new.
	self
		assertWriting: item
		includesTexts:
			{self underlineFoo}
]

{ #category : #tests }
PRDocumentWriterTest >> testUnorderedList [
	| item |
	item := PRUnorderedList new
		add: (self addText: '1' to: PRListItem new);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self unorderedListBegin).
			(self listItemWith1)}
]

{ #category : #tests }
PRDocumentWriterTest >> testWritersAreNotResponsibleForHeadingLevelOffset [
	| item |
	item := PRHeader new
		level: 1;
		add: (PRText content: 'foo');
		yourself.
	self assertWriting: item includesTexts: {self level1HeaderWithFoo}.
	self configuration headingLevelOffset: 2.
	"Writers should *not* take care of headingLevelOffset:"
	self assertWriting: item includesTexts: {self level1HeaderWithFoo}
]

{ #category : #requirements }
PRDocumentWriterTest >> underlineFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> unorderedListBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest >> widthFor50percents [
	^ '50'
]

{ #category : #helpers }
PRDocumentWriterTest >> write: aDocumentItem [

	^ String
		streamContents: [ :stream | 
			| writer |
			writer := self createWriterOn: stream.
			writer start: aDocumentItem ]
]

{ #category : #helpers }
PRDocumentWriterTest >> writeWithSeparateOutputFiles: aDocumentItem [
	| writer |
	^ String
		streamContents: [ :stream | 
			writer := self createWriterWithSeparateOutputFilesOn: stream.
			writer start: aDocumentItem ]
]
