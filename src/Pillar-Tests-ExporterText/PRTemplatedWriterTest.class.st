Class {
	#name : #PRTemplatedWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'textDocument'
	],
	#category : #'Pillar-Tests-ExporterText'
}

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> assertTemplate: template writesValue: value forNode: node [

	self assertTemplatePath: Path * template writesValue: value forNode: node 
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> assertTemplatePath: templatePath writesValue: contents forNode: node [

	self createTemplateFileAt: templatePath withContents: contents.
	self assertWritingNode: node writes: contents.
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> assertWritingNode: node writes: contents [

	| document result writer |
	document := PRDocument new
		add: node;
		yourself.

	result := textDocument writer write: document.
		
	self assert: result equals: contents
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> createTemplateFileAt: aPath withContents: contents [

	| templateFileReference |
	templateFileReference := textDocument templateDirectory resolve: aPath.
	templateFileReference parent ensureCreateDirectory.
	templateFileReference writeStreamDo: [ :stream | stream nextPutAll: contents ].
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> setUp [

	super setUp.
	textDocument := PRTextDocument new
			project: (PRProject new
				baseDirectory: FileSystem memory;
				beTemplatable;
				yourself);
			yourself.
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteAnchorUsesAnchorTemplate [

	self
		assertTemplate: 'todo.mustache'
		writesValue: 'annotated paragraph'
		forNode: (PRAnnotatedParagraph withAll: #() annotation: 'todo')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteAnchorUsesDefaultIfNotSpecificIsDefinedTemplate [

	self
		assertTemplate: PRTemplatedWriter defaultAnnotatedParagraphTemplateFileName
		writesValue: 'annotated paragraph'
		forNode: (PRAnnotatedParagraph withAll: #() annotation: 'todo')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteBoldUsesBoldTemplate [

	self
		assertTemplate: PRTemplatedWriter boldTemplateFileName
		writesValue: 'boldTemplate'
		forNode: (PRBoldFormat with: (PRText content: 'Bar'))
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteCodeBlockUsesCodeBlockTemplate [

	self
		assertTemplate: PRTemplatedWriter codeBlockTemplateFileName
		writesValue: 'codeBlockTemplate'
		forNode: (PRCodeblock content: '^ self')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteCommentedLineUsesCommentedLineTemplate [

	self
		assertTemplate: PRTemplatedWriter commentedLineTemplateFileName
		writesValue: 'commented line'
		forNode: (PRCommentedLine content: 'some comment')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteDataItemUsesDataItemTemplate [

	self
		assertTemplate: PRTemplatedWriter dataItemTemplateFileName
		writesValue: 'dataitem'
		forNode: PRDataItem new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteDefinitionListUsesDefinitionListTemplate [

	self
		assertTemplate: PRTemplatedWriter definitionListTemplateFileName
		writesValue: 'definitionList'
		forNode: PRDefinitionList new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteEmptyParagraphsUsesEmptyParagraphTemplate [

	self
		assertTemplate: PRTemplatedWriter emptyParagraphTemplateFileName
		writesValue: 'emptyParagraph'
		forNode: PREmptyParagraph new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteEnvironmentItselfUsesMainTemplate [

	self
		assertTemplatePath: RelativePath * 'cards' / 'main.mustache'
		writesValue: 'Template for cards itself'
		forNode: ((PREnvironment named: 'cards')
						add: (PRParagraph new
							add: (PRText content: 'Foo');
							yourself);
			yourself)
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteEnvironmentUsesArguments [

	self
		createTemplateFileAt: RelativePath * 'card' / 'main.mustache'
		withContents: 'before {{{someArgument}}} after'.

	self
		assertWritingNode: ((PREnvironment named: 'card')
			propertyAt: 'someArgument' put: 'test';
			yourself)
		writes: 'before test after'
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteExternalLinkUsesExternalLinkTemplate [

	self
		assertTemplate: PRTemplatedWriter externalLinkTemplateFileName
		writesValue: 'external link'
		forNode: (PRExternalLink new reference: 'http://pharo.org')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteFigureUsesFigureTemplate [

	self
		assertTemplate: PRTemplatedWriter figureTemplateFileName
		writesValue: 'figure'
		forNode: (PRFigure reference: 'bla.png')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteHeaderUsesHeaderTemplate [

	self
		assertTemplate: PRTemplatedWriter headerTemplateFileName
		writesValue: 'aHeader'
		forNode: (PRHeader new
			level: 2;
			add: (PRText content: 'foo'))
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteHorizontalRuleUsesHorizontalRuleTemplate [

	self
		assertTemplate: PRTemplatedWriter horizontalRuleTemplateFileName
		writesValue: '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
		forNode: PRHorizontalRule new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteInternalLinkUsesInternalLinkTemplate [

	self
		assertTemplate: PRTemplatedWriter internalLinkTemplateFileName
		writesValue: 'internal link'
		forNode: (PRInternalLink new reference: 'bla.pillar')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteItalicUsesItalicTemplate [

	self
		assertTemplate: PRTemplatedWriter italicTemplateFileName
		writesValue: 'italicTemplate'
		forNode: (PRItalicFormat with: (PRText content: 'Bar'))
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteLineBreakUsesLineBreakTemplate [

	self
		assertTemplate: PRTemplatedWriter lineBreakTemplateFileName
		writesValue: 'line break'
		forNode: PRLineBreak new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteListItemUsesListItemTemplate [

	self
		assertTemplate: PRTemplatedWriter listItemTemplateFileName
		writesValue: 'list item'
		forNode: PRListItem new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteMailLinkUsesMailLinkTemplate [

	self
		assertTemplate: PRTemplatedWriter mailLinkTemplateFileName
		writesValue: 'a link'
		forNode: (PRMailLink reference: 'foo@bar.com')
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteMonospaceUsesMonospaceTemplate [

	self
		assertTemplate: PRTemplatedWriter monospaceTemplateFileName
		writesValue: 'monospace'
		forNode: (PRMonospaceFormat with: (PRText content: 'Bar'))
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteNestedEnvironmentItselfUsesMainTemplate [

	self
		assertTemplatePath: RelativePath * 'cards' / 'card' / 'main.mustache'
		writesValue: 'Template for the card itself'
		forNode: ((PREnvironment named: 'cards')
						add: ((PREnvironment named: 'card')
									add: (PRParagraph new add: (PRText content: 'Foo');
							yourself));
					yourself)
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteNestedEnvironmentWithChilds [

	self
		createTemplateFileAt: RelativePath * 'cards' / 'main.mustache'
		withContents: '{{{contents}}}'.
	self
		createTemplateFileAt: RelativePath * 'cards' / 'card' / 'main.mustache'
		withContents: '{{{contents}}}'.

	self
		assertTemplatePath: RelativePath * 'cards' / 'card' / 'paragraph.mustache'
		writesValue: 'Paragraph definition in cards/card'
		forNode: ((PREnvironment named: 'cards')
						add: ((PREnvironment named: 'card')
									add: (PRParagraph new add: (PRText content: 'Foo');
							yourself));
					yourself)
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteOrderedListUsesOrderedListTemplate [

	self
		assertTemplate: PRTemplatedWriter orderedListTemplateFileName
		writesValue: 'ordered list'
		forNode: PROrderedList new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteParagraphUsesParagraphTemplate [

	self
		assertTemplate: PRTemplatedWriter paragraphTemplateFileName
		writesValue: 'unorderedList'
		forNode: PRParagraph new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWritePreformattedUsesPreformattedTemplate [

	self
		assertTemplate: PRTemplatedWriter preformattedTemplateFileName
		writesValue: 'preformatted'
		forNode: (PRPreformatted with: (PRText content: 'Bar'))
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteSectionUsesSectionTemplate [

	self
		assertTemplate: PRTemplatedWriter sectionTemplateFileName
		writesValue: 'section'
		forNode: PRSection new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteTextInsideEnvironmentLooksUpOutsideEnvironment [

	self
		assertTemplate: 'paragraph.mustache'
		writesValue: 'Paragraph outside card'
		forNode: ((PREnvironment named: 'card')
			add: (PRParagraph new
				add: (PRText content: 'Foo');
				yourself);
			yourself)
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteTextInsideEnvironmentUsesTemplateInsideEnvironment [

	self
		assertTemplatePath: (Path * 'card' / 'paragraph.mustache')
		writesValue: 'Paragraph in card'
		forNode: ((PREnvironment named: 'card')
			add: (PRParagraph new
				add: (PRText content: 'Foo');
				yourself);
			yourself)
]
