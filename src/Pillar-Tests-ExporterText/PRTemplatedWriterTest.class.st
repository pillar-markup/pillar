Class {
	#name : #PRTemplatedWriterTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-ExporterText'
}

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> assertTemplate: template writesValue: value forNode: node [

	| document result writer textDocument templateFileReference |
	
	textDocument := PRTextDocument new
			project: (PRProject new
				baseDirectory: FileSystem memory;
				yourself);
			yourself.
	writer := PRTemplatedWriter new
		outputDocument: textDocument;
		defaultWriter: PRTextWriter new;
		yourself.

	templateFileReference := textDocument templateDirectory / template.
	templateFileReference parent ensureCreateDirectory.
	templateFileReference writeStreamDo: [ :stream | stream nextPutAll: value ].

	document := PRDocument new
		add: node;
		yourself.

	result := writer write: document.
		
	self assert: result equals: value
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
PRTemplatedWriterTest >> testWriteOrderedListUsesOrderedListTemplate [

	self
		assertTemplate: PRTemplatedWriter orderedListTemplateFileName
		writesValue: 'ordered list'
		forNode: PROrderedList new
]

{ #category : #'tests-templatefiles' }
PRTemplatedWriterTest >> testWriteParagraphUsesParagraphTemplate [

	self
		assertTemplate: PRTemplatedWriter unorderedListTemplateFileName
		writesValue: 'unorderedList'
		forNode: PRUnorderedList new
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
