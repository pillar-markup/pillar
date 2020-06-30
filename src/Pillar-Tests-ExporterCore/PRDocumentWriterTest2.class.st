Class {
	#name : #PRDocumentWriterTest2,
	#superclass : #PRVisitorTest,
	#instVars : [
		'configuration'
	],
	#category : #'Pillar-Tests-ExporterCore-LevelPrinter'
}

{ #category : #testing }
PRDocumentWriterTest2 class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #PRDocumentWriterTest2
]

{ #category : #private }
PRDocumentWriterTest2 >> actualClass [
	^ PRDocumentWriter
]

{ #category : #private }
PRDocumentWriterTest2 >> actualInstance [
	^  self createWriterOn: String new
]

{ #category : #tests }
PRDocumentWriterTest2 >> annotation [
	
	^ self shouldBeImplemented.  
]

{ #category : #asserting }
PRDocumentWriterTest2 >> assert: result includesSubstring: expected [
	expected ifEmpty: [ ^ self ].
	self assert: (result includesSubstring: expected) description: ('''{1}'' not in ''{2}''' format: {expected . result})
]

{ #category : #asserting }
PRDocumentWriterTest2 >> assertWriting: aDocumentItem includesText: aString [
	| result |
	result := self write: aDocumentItem.
	self assert: result includesSubstring: aString
]

{ #category : #asserting }
PRDocumentWriterTest2 >> assertWriting: aDocumentItem includesTexts: aCollection [
	| resultString |
	resultString := self write: aDocumentItem.
	aCollection do: [ :testString | self assert: resultString includesSubstring: testString ]
]

{ #category : #requirements }
PRDocumentWriterTest2 >> boldFoo [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRDocumentWriterTest2 >> configuration [
	^ configuration ifNil: [ configuration := self configurationClass new ]
]

{ #category : #helpers }
PRDocumentWriterTest2 >> configurationClass [
	^ ConfigurationForPillar
]

{ #category : #helpers }
PRDocumentWriterTest2 >> createWriterOn: aWriteStream [ 
	^ (self actualClass on: aWriteStream)
		configuration: self configuration;
		yourself
]

{ #category : #helpers }
PRDocumentWriterTest2 >> createWriterWithSeparateOutputFilesOn: aWriteStream [
	^ (self actualClass on: aWriteStream)
		configuration:
				(self configurationClass new
						separateOutputFiles: true;
						yourself);
		yourself
]

{ #category : #requirements }
PRDocumentWriterTest2 >> dataItemWithBar [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> definitionListBegin [
	self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> emailToFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> figureAnchorForPierLogo [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest2 >> figureBegin [
	^ self subclassResponsibility
]

{ #category : #data }
PRDocumentWriterTest2 >> foo [
	^ 'foo'
]

{ #category : #requirements }
PRDocumentWriterTest2 >> footnoteBar [
	^ ''
]

{ #category : #requirements }
PRDocumentWriterTest2 >> horizontalRule [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> italicFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> level1HeaderBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> level1HeaderWithFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> level2HeaderBegin [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest2 >> listItemWith1 [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> monospaceFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> orderedListBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> packageNamesUnderTest [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> paragraphFoo [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRDocumentWriterTest2 >> parser [
	^ PRPillarParserMain
]

{ #category : #requirements }
PRDocumentWriterTest2 >> preformattedFooBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> preformattedTextFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> rawText [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> referenceToFigurePierLogo [
	^ self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithRefWithAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithRefWithoutAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithRefWithoutAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithoutRefWithAnchorWithSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #'requirement-InternalLinks' }
PRDocumentWriterTest2 >> resultWithoutRefWithAnchorWithoutSeparateOutputFiles [
	self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> scriptAnchorForMyScript [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> scriptWithCaptionBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> scriptWithoutCaptionBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> strikethroughFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> subscriptFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> superscriptFoo [
	^ self subclassResponsibility
]

{ #category : #tests }
PRDocumentWriterTest2 >> supportSyntaxHighlighting [
	^ true
]

{ #category : #requirements }
PRDocumentWriterTest2 >> tableBegin [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest2 >> tableCellWithFoo [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest2 >> tableCellWithHeadingFoo [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest2 >> tableRow [
	^ self subclassResponsibility 
]

{ #category : #requirements }
PRDocumentWriterTest2 >> termItemWithFoo [
	^ self subclassResponsibility
]

{ #category : #tests }
PRDocumentWriterTest2 >> testAnnotation [
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
PRDocumentWriterTest2 >> testBoldFormat [
	| item |
	item := self addText: 'foo' to: PRBoldFormat new.
	self
		assertWriting: item
		includesTexts:
			{self boldFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testCommentedLineNotVisibleInOutput [
	| item result |
	item := PRCommentedLine content: 'some comment'.
	result := self write: item.
	self assertEmpty: result
]

{ #category : #tests }
PRDocumentWriterTest2 >> testConsecutiveTextsInAParagraphAreSeparatedByWhitespace [
	| item |
	item := PRParagraph new
		add: (PRText content: 'foo');
		add: (PRLineBreak new);
		add: (PRText content: 'bar');
		yourself.
	self assertWriting: item includesText: 'foo', self configuration newLine, 'bar'
]

{ #category : #tests }
PRDocumentWriterTest2 >> testDefinitionList [
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
PRDocumentWriterTest2 >> testFigure [
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
PRDocumentWriterTest2 >> testFigureLabelGenerateAnchor [
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
PRDocumentWriterTest2 >> testFigureReference [
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
PRDocumentWriterTest2 >> testFigureWithLabelAndWithCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		label: 'label';
		yourself.
	self assertWriting: item includesText: self figureBegin
]

{ #category : #tests }
PRDocumentWriterTest2 >> testFigureWithLabelAndWithoutCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		label: 'label';
		yourself.
	self assertWriting: item includesText: self figureBegin
]

{ #category : #tests }
PRDocumentWriterTest2 >> testFigureWithWidth [
	| item width |
	width := '50'.
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'width' put: width;
		yourself.
	self assertWriting: item includesText: self widthFor50percents
]

{ #category : #tests }
PRDocumentWriterTest2 >> testFigureWithoutLabelAndWithCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		yourself.
	self assertWriting: item includesText: self figureBegin
]

{ #category : #tests }
PRDocumentWriterTest2 >> testFigureWithoutLabelAndWithoutCaptionAreExportedWithoutEnvironment [
	| item result |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	result := self write: item.
	self figureBegin ifNotEmpty: [ self deny: (result includesSubstring: self figureBegin) ]
]

{ #category : #tests }
PRDocumentWriterTest2 >> testFiguresHaveACaption [
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
PRDocumentWriterTest2 >> testFileExtension [
	| fileExtension |
	fileExtension := self instance fileExtension.
	self assert: fileExtension isNotNil.
	self assert: fileExtension isString
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testFootnote [
	| item |
	item := PRParagraph new
		add: (PRText content: 'timo');
		add: (PRFootnote noted: 'Bar');
		add: (PRText content: 'leon');
		yourself.
	self assertWriting: item includesText: self footnoteBar
]

{ #category : #tests }
PRDocumentWriterTest2 >> testHasName [
	self denyEmpty: self actualClass writerName
]

{ #category : #tests }
PRDocumentWriterTest2 >> testHeader [
	| item |
	item := PRHeader new
		level: 1;
		add: (PRText content: 'foo');
		yourself.
	self assertWriting: item includesTexts: {self level1HeaderWithFoo}.
]

{ #category : #tests }
PRDocumentWriterTest2 >> testHorizontalRule [
	| item  |
	item := PRHorizontalRule new.
	self assertWriting: item includesText: self horizontalRule
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testInternalLinkWithAliasWithRefWithAncorWithSeparateOutputFiles [
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
PRDocumentWriterTest2 >> testInternalLinkWithAliasWithRefWithAncorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
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
PRDocumentWriterTest2 >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testInternalLinkWithAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
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
PRDocumentWriterTest2 >> testInternalLinkWithAliasWithoutReferenceWithAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithoutRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutRefWithAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testInternalLinkWithoutAliasWithRefWithAncorWithSeparateOutputFiles [
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
PRDocumentWriterTest2 >> testInternalLinkWithoutAliasWithRefWithAncorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar@foo');
		yourself.
	resultString := self write: item.
	self resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles) ]
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
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
PRDocumentWriterTest2 >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar')
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ].
]

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
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

{ #category : #'tests-internalLinks' }
PRDocumentWriterTest2 >> testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithoutSeparateOutputFiles [
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles) ]
]

{ #category : #tests }
PRDocumentWriterTest2 >> testItalicFormat [
	| item |
	item := self addText: 'foo' to: PRItalicFormat new.
	self
		assertWriting: item
		includesTexts:
			{self italicFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testLanguageForScript [
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
PRDocumentWriterTest2 >> testLanguageForScript2 [
	"This test documents how to map values to script languages"
	
	self assert: (PRRealScriptLanguage for: nil) class equals: PRUnspecifiedScriptLanguage.
	self assert: (PRRealScriptLanguage for: 'nil') class equals:  PRUnsupportedScriptLanguage.
	self assert: (PRRealScriptLanguage for: '') class equals:  PRUnsupportedScriptLanguage.
	self assert: (PRRealScriptLanguage for: 'smalltalk') class equals:  PRSmalltalkScriptLanguage.
]

{ #category : #tests }
PRDocumentWriterTest2 >> testMailLink [
	| item |
	configuration propertyAt: #scrambledEmailAddresses put: false.
	item := self addText: 'Foo Bar' to: (PRMailLink reference: 'foo@bar.com').
	self
		assertWriting: item
		includesTexts:
			{self emailToFoo . 'Foo Bar'}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testMarkupType [
	| markupType |
	markupType := self instance markupType.
	self assert: markupType isNotNil.
	self assert: markupType isSymbol
]

{ #category : #tests }
PRDocumentWriterTest2 >> testMonospaceFormat [
	| item |
	item := self addText: 'foo' to: PRMonospaceFormat new.
	self
		assertWriting: item
		includesTexts:
			{self monospaceFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testOrderedList [
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
PRDocumentWriterTest2 >> testParagraph [
	| item |
	item := self addText: 'foo' to: PRParagraph new.
	self assertWriting: item includesText: self paragraphFoo
]

{ #category : #tests }
PRDocumentWriterTest2 >> testPreformatted [
	| item |
	item := self addText: 'foo' to: PRPreformatted new.
	self assertWriting: item includesTexts: {self preformattedFooBegin . self preformattedTextFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testPreformattedWithMultipleLines [
	| item |
	item := PRPreformatted new
		add: (PRText content: 'foo');
		add: (PRText content: 'bar');
		yourself.
	self assertWriting: item includesText: 'foo' , self configuration newLine
]

{ #category : #tests }
PRDocumentWriterTest2 >> testRaw [
	| item |
	item := PRRaw content: self rawText.
	self
		assertWriting: item
		includesText:
			self rawText
]

{ #category : #tests }
PRDocumentWriterTest2 >> testScript [
	| item |
	item := PRCodeblock content: 'foo'.
	self assertWriting: item includesTexts: {self scriptWithoutCaptionBegin . self foo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testScriptDefaultLanguage [
	| item |
	self supportSyntaxHighlighting
		ifFalse: [ self skip ].
	item := PRCodeblock content: 'foo'.
	configuration defaultScriptLanguage: PRHTMLScriptLanguage default.
	self assertWriting: item includesTexts: {PRHTMLScriptLanguage standardName}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testScriptLabelGenerateAnchor [
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
PRDocumentWriterTest2 >> testScriptLanguage [
	| item |
	self supportSyntaxHighlighting ifFalse: [ self skip ].
	item := (PRCodeblock content: 'foo')
		language: 'html';
		yourself.
	self assertWriting: item includesTexts: {(PRHTMLScriptLanguage standardName)}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testScriptWithFormattedCaption [
	| item |
	item := (PRCodeblock content: 'bar')
		caption: '""foo""';
		yourself.
	self assertWriting: item includesText: self boldFoo
]

{ #category : #tests }
PRDocumentWriterTest2 >> testScriptWithProblematicEval [
	| item nonExistingMethod |
	nonExistingMethod := 'FooBarDoesNotExistX'.
	item := (PRCodeblock content: 'Object ' , nonExistingMethod)
		eval: true;
		yourself.
	self assert: item isEvaluated.
	self assertWriting: item includesText: nonExistingMethod
]

{ #category : #tests }
PRDocumentWriterTest2 >> testScriptsHaveACaption [
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
PRDocumentWriterTest2 >> testSpecifyPackageNamesUnderTest [
	self assert: self packageNamesUnderTest isCollection.
	self denyEmpty: self packageNamesUnderTest.
	self packageNamesUnderTest do: [ :packageName | self denyEmpty: (RPackage organizer packageNamed: packageName) methodReferences ]
]

{ #category : #tests }
PRDocumentWriterTest2 >> testStrikethroughFormat [
	| item |
	item := self addText: 'foo' to: PRStrikethroughFormat new.
	self
		assertWriting: item
		includesTexts:
			{self strikethroughFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testSubscriptFormat [
	| item |
	item := self addText: 'foo' to: PRSubscriptFormat new.
	self
		assertWriting: item
		includesTexts:
			{self subscriptFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testSuperscriptFormat [
	| item |
	item := self addText: 'foo' to: PRSuperscriptFormat new.
	self
		assertWriting: item
		includesTexts:
			{self superscriptFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testTable [
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
PRDocumentWriterTest2 >> testTableWith2CellsInARow [
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
PRDocumentWriterTest2 >> testTableWithHeading [
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
PRDocumentWriterTest2 >> testUnderlineFormat [
	| item |
	item := self addText: 'foo' to: PRUnderlineFormat new.
	self
		assertWriting: item
		includesTexts:
			{self underlineFoo}
]

{ #category : #tests }
PRDocumentWriterTest2 >> testUnorderedList [
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
PRDocumentWriterTest2 >> testWritersAreNotResponsibleForHeadingLevelOffset [
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
PRDocumentWriterTest2 >> underlineFoo [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> unorderedListBegin [
	^ self subclassResponsibility
]

{ #category : #requirements }
PRDocumentWriterTest2 >> widthFor50percents [
	^ '50'
]

{ #category : #helpers }
PRDocumentWriterTest2 >> write: aDocumentItem [
	
	^ String
		streamContents: [ :stream | 
			| writer |
			writer := self createWriterOn: stream.
			writer start: aDocumentItem ]
]

{ #category : #helpers }
PRDocumentWriterTest2 >> writeWithSeparateOutputFiles: aDocumentItem [
	| writer |
	^ String
		streamContents: [ :stream | 
			writer := self createWriterWithSeparateOutputFilesOn: stream.
			writer start: aDocumentItem ]
]
