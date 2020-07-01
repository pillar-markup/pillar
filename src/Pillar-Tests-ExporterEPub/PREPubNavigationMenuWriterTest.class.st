Class {
	#name : #PREPubNavigationMenuWriterTest,
	#superclass : #PRHTMLWriterTest,
	#category : #'Pillar-Tests-ExporterEPub'
}

{ #category : #private }
PREPubNavigationMenuWriterTest >> actualClass [
	^PREPubNavigationMenuWriter 
]

{ #category : #requirements }
PREPubNavigationMenuWriterTest >> level1HeaderWithFoo [
	^'<li><a href="contents.xhtml#foo">foo'
]

{ #category : #requirements }
PREPubNavigationMenuWriterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterEPub')
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testAnnotation [
	| item |
	{'note' . 'dothis'}
		do: [ :annotation | 
			item := PRAnnotatedParagraph new
				annotation: annotation;
				add: (PRText content: 'foo');
				yourself.
			self assertEmpty: (self write: item) ]
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testConsecutiveTextsInAParagraphAreSeparatedByWhitespace [
	| item |
	item := PRParagraph new
		add: (PRText content: 'foo');
		add: PRLineBreak new;
		add: (PRText content: 'bar');
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testDefinitionList [
	| item |
	item := PRDefinitionList new
		add: (self addText: 'foo' to: PRTermItem new);
		add: (self addText: 'bar' to: PRDataItem new);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testExportingIsolatedRaw [
	"The idea is that you don''t want the <p> when using a Raw that potentially displays a <div>, because this is not HTML compliant"

	| item |
	item := PRDocument new
		add:
			(PRParagraph new
				add: (PRRaw content: '<div>foo</div>');
				yourself);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFigure [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFigureLabelGenerateAnchor [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'label' put: 'pierLogo';
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFigureReference [
	| item |
	item := PRParagraph new
		add:
			(PRFigure new
				reference: 'file://picture.png';
				parameterAt: 'label' put: 'pierLogo';
				counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 2);
				yourself);
		add: (PRText content: 'See figure ');
		add: ((PRInternalLink reference: '@pierLogo') counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 2));
		yourself.
	self write: item.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFigureWithLabelAndWithCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		label: 'label';
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFigureWithLabelAndWithoutCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		label: 'label';
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFigureWithWidth [
	| item width |
	width := '50'.
	item := PRFigure new
		reference: 'file://picture.png';
		parameterAt: 'width' put: width;
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFigureWithoutLabelAndWithCaptionAreExportedWithEnvironment [
	| item |
	item := PRFigure new
		reference: 'file://picture.png';
		add: (PRText content: 'caption');
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFiguresHaveACaption [
	| item caption filename |
	caption := 'A description'.
	filename := 'picture.png'.
	item := PRFigure new
		reference: 'file://' , filename;
		label: 'picture';
		add: (PRText content: caption);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testFootnote [
	| item |
	item := PRParagraph new
		add: (PRText content: 'timo');
		add: (PRFootnote noted: 'Bar');
		add: (PRText content: 'leon');
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testHeadersAreNumbered [
	self skip: 'Headers are not numbered in navigation menu'
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithAliasWithRefWithAncorWithSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
			((PRInternalLink reference: 'ref.pillar@foo')
				addAll: {(PRText content: 'Alias')};
				yourself);
		yourself.
	self assertEmpty: (self writeWithSeparateOutputFiles: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithAliasWithRefWithAncorWithoutSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
			((PRInternalLink reference: 'ref.pillar@foo')
				addAll: {(PRText content: 'Alias')};
				yourself);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
			((PRInternalLink reference: 'ref.pillar')
				addAll: {(PRText content: 'Alias')};
				yourself);
		yourself.
	self assertEmpty: (self writeWithSeparateOutputFiles: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
			((PRInternalLink reference: 'ref')
				addAll: {(PRText content: 'Alias')};
				yourself);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
			((PRInternalLink reference: '@foo')
				addAll: {(PRText content: 'Alias')};
				yourself);
		yourself.
	self assertEmpty: (self writeWithSeparateOutputFiles: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithAliasWithoutReferenceWithAnchorWithoutSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
			((PRInternalLink reference: '@foo')
				addAll: {(PRText content: 'Alias')};
				yourself);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithoutAliasWithRefWithAncorWithSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar@foo');
		yourself.
	self assertEmpty: (self writeWithSeparateOutputFiles: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithoutAliasWithRefWithAncorWithoutSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar@foo');
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar');
		yourself.
	self assertEmpty: (self writeWithSeparateOutputFiles: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
			((PRInternalLink reference: 'ref')
				addAll: {(PRText content: 'Alias')};
				yourself);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: '@foo') yourself;
		yourself.
	self assertEmpty: (self writeWithSeparateOutputFiles: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithoutSeparateOutputFiles [
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: '@foo') yourself;
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testOrderedList [
	| item |
	item := PROrderedList new
		add: (self addText: '1' to: PRListItem new);
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testParagraph [
	| item |
	item := self addText: 'foo' to: PRParagraph new.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testReferenceToFigureAnchor [
	| item resultString |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add:
				(PRParagraph new
						add:
								(PRFigure new
										reference: 'file://picture.png';
										parameterAt: 'label' put: 'fig:picture';
										counter:
												((PRCascadingCounter maxLevel: 5)
														incrementAt: 1;
														incrementAt: 2);
										yourself);
						add: (PRText content: 'See Figure ');
						add:
								((PRInternalLink reference: 'fig:picture')
										counter:
												((PRCascadingCounter maxLevel: 5)
														incrementAt: 1;
														incrementAt: 2);
										yourself);
						yourself).
	resultString := self write: item.
	self assert: resultString includesSubstring: self level1HeaderWithFoo
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testReferenceToHeaderAnchor [
	| item resultString |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add: (PRAnchor named: 'chap:foo');
		add:
				(PRParagraph new
						add: (PRText content: 'See Chapter ');
						add:
								((PRInternalLink reference: 'chap:foo')
										counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
										yourself);
						yourself);
		yourself.
	resultString := self write: item.
	self assert: resultString includesSubstring: self level1HeaderWithFoo
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testScript [
	| item |
	item := PRCodeblock content: 'foo'.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testScriptDefaultLanguage [
	| item |
	self supportSyntaxHighlighting ifFalse: [ self skip ].
	item := PRCodeblock content: 'foo'.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testScriptLabelGenerateAnchor [
	| item |
	item := (PRCodeblock content: 'foo')
		label: 'myScript';
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testScriptLanguage [
	| item |
	self supportSyntaxHighlighting ifFalse: [ self skip ].
	item := (PRCodeblock content: 'foo')
		language: 'html';
		yourself.
	self assertEmpty: (self writeWithSeparateOutputFiles: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testScriptWithFormattedCaption [
	| item |
	item := (PRCodeblock content: 'bar')
		caption: '""foo""';
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testScriptWithProblematicEval [
	| item nonExistingMethod |
	nonExistingMethod := 'FooBarDoesNotExistX'.
	item := (PRCodeblock content: 'Object ' , nonExistingMethod)
		eval: true;
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testScriptsHaveACaption [
	| item caption |
	caption := 'A description'.
	item := (PRCodeblock content: 'foo')
		caption: caption;
		yourself.
	self assertEmpty: (self write: item)
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testSubHeadersAreNumbered [
	self skip: 'Headers are not numbered in navigation menu'
]

{ #category : #tests }
PREPubNavigationMenuWriterTest >> testUnorderedList [
	| item |
	item := PRUnorderedList new
		add: (self addText: '1' to: PRListItem new);
		yourself.
	self assertEmpty: (self write: item)
]
