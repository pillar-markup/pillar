"
I am a pillar document writer that wraps a normal wrapper.
When writing one element, I first check if there is a file in the current template that overrides the default writing. If so, I use that file to template the contents.
Otherwise I simply delegate the writing to the wrapped one.

I am carefully designed so if an element X is delegated to the wrapped writer, it should delegate the writing of X's children back to myself.
"
Class {
	#name : #PRTemplatedWriter,
	#superclass : #PRVisitor,
	#instVars : [
		'outputDocument',
		'defaultWriter',
		'environmentStack'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #templates }
PRTemplatedWriter class >> anchorTemplateFileName [
	
	^ 'anchor.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> boldTemplateFileName [
	
	^ 'bold.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> codeBlockTemplateFileName [
	
	^ 'codeBlock.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> commentedLineTemplateFileName [
	
	^ 'commentedLine.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> dataItemTemplateFileName [
	
	^ 'dataItem.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> defaultAnnotatedParagraphTemplateFileName [
	
	^ 'defaultAnnotatedParagraph.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> definitionListTemplateFileName [
	
	^ 'definitionList.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> emptyParagraphTemplateFileName [

	^ 'emptyParagraph.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> externalLinkTemplateFileName [
	
	^ 'externalLink.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> figureTemplateFileName [

	^ 'figure.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> headerTemplateFileName [
	
	^ 'header.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> horizontalRuleTemplateFileName [
	
	^ 'horizontalRule.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> internalLinkTemplateFileName [
	
	^ 'internalLink.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> italicTemplateFileName [
	
	^ 'italic.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> lineBreakTemplateFileName [
	
	^ 'lineBreak.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> listItemTemplateFileName [

	^ 'listItem.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> mailLinkTemplateFileName [
	
	^ 'mailLink.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> monospaceTemplateFileName [

	^ 'monospace.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> orderedListTemplateFileName [
	
	^ 'orderedList.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> paragraphTemplateFileName [
	
	^ 'paragraph.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> preformattedTemplateFileName [
	
	^ 'preformatted.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> sectionTemplateFileName [
	
	^ 'section.mustache'
]

{ #category : #templates }
PRTemplatedWriter class >> unorderedListTemplateFileName [

	^ 'unorderedList.mustache'
]

{ #category : #accessing }
PRTemplatedWriter class >> writerName [

	^ #templatedWriter
]

{ #category : #accessing }
PRTemplatedWriter >> anchorTemplateFileName [

	^ self class anchorTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> boldTemplateFileName [

	^ self class boldTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> codeBlockTemplateFileName [

	^ self class codeBlockTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> commentedLineTemplateFileName [

	^ self class commentedLineTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> contents [
	
	^ defaultWriter contents
]

{ #category : #environment }
PRTemplatedWriter >> currentEnvironmentPath [
	
	^ RelativePath withAll: (environmentStack collect: #name) reversed
]

{ #category : #accessing }
PRTemplatedWriter >> dataItemTemplateFileName [

	^ self class dataItemTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> defaultAnnotatedParagraphTemplateFileName [

	^ self class defaultAnnotatedParagraphTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> defaultWriter [
	^ defaultWriter
]

{ #category : #accessing }
PRTemplatedWriter >> defaultWriter: anObject [
	defaultWriter := anObject
]

{ #category : #accessing }
PRTemplatedWriter >> definitionListTemplateFileName [

	^ self class definitionListTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> emptyParagraphTemplateFileName [

	^ self class emptyParagraphTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> environmentStack: aCollection [ 
	environmentStack := aCollection
]

{ #category : #accessing }
PRTemplatedWriter >> externalLinkTemplateFileName [

	^ self class externalLinkTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> figureTemplateFileName [

	^ self class figureTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> folderName [

	^ defaultWriter folderName
]

{ #category : #accessing }
PRTemplatedWriter >> headerTemplateFileName [

	^ self class headerTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> horizontalRuleTemplateFileName [

	^ self class horizontalRuleTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> initialize [
	super initialize.
	environmentStack := OrderedCollection new.
]

{ #category : #accessing }
PRTemplatedWriter >> internalLinkTemplateFileName [

	^ self class internalLinkTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> italicTemplateFileName [
		
	^ self class italicTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> lineBreakTemplateFileName [

	^ self class lineBreakTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> listItemTemplateFileName [

	^ self class listItemTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> mailLinkTemplateFileName [

	^ self class mailLinkTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> monospaceTemplateFileName [

	^ self class monospaceTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> orderedListTemplateFileName [

	^ self class orderedListTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> outputDocument [
	^ outputDocument
]

{ #category : #accessing }
PRTemplatedWriter >> outputDocument: anObject [
	outputDocument := anObject
]

{ #category : #accessing }
PRTemplatedWriter >> paragraphTemplateFileName [

	^ self class paragraphTemplateFileName
]

{ #category : #environment }
PRTemplatedWriter >> popEnvironment [
	
	environmentStack removeFirst
]

{ #category : #accessing }
PRTemplatedWriter >> preformattedTemplateFileName [

	^ self class preformattedTemplateFileName
]

{ #category : #environment }
PRTemplatedWriter >> pushEnvironment: aPREnvironment [ 
	
	environmentStack addFirst: aPREnvironment
]

{ #category : #accessing }
PRTemplatedWriter >> sectionTemplateFileName [

	^ self class sectionTemplateFileName
]

{ #category : #accessing }
PRTemplatedWriter >> templateForConfiguration: aConfiguration [

	^ defaultWriter templateForConfiguration: aConfiguration
]

{ #category : #accessing }
PRTemplatedWriter >> unorderedListTemplateFileName [

	^ self class unorderedListTemplateFileName
]

{ #category : #visiting }
PRTemplatedWriter >> visitAnchor: aPRAnchor [

	self
		writeRawText: ''
		withTemplateFileName: self anchorTemplateFileName
		extraArguments: { 'name' -> aPRAnchor name }
		ifAbsent: [ defaultWriter visitAnchor: aPRAnchor ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [

	| arguments |
	arguments := { 'annotation' -> anAnnotatedParagraph annotation }.
	self
		write: anAnnotatedParagraph
		withTemplateFileName: anAnnotatedParagraph annotation , '.mustache'
		extraArguments: arguments 
		ifAbsent: [
			self
				write: anAnnotatedParagraph
				withTemplateFileName: self defaultAnnotatedParagraphTemplateFileName
				extraArguments: arguments 
				ifAbsent: [ defaultWriter visitAnnotatedParagraph: anAnnotatedParagraph ] ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitBoldFormat: aPRBoldFormat [

	self
		write: aPRBoldFormat
		withTemplateFileName: self boldTemplateFileName
		ifAbsent: [ defaultWriter visitBoldFormat: aPRBoldFormat ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitCodeblock: aPRCodeblock [ 

	self
		writeRawText: aPRCodeblock text
		withTemplateFileName: self codeBlockTemplateFileName
		extraArguments: { 'language' -> (defaultWriter languageForScript: aPRCodeblock) }
		ifAbsent: [ defaultWriter visitCodeblock: aPRCodeblock ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitCommentedLine: aPRText [ 

	self
		writeRawText: aPRText text
		withTemplateFileName: self commentedLineTemplateFileName
		ifAbsent: [ defaultWriter visitCommentedLine: aPRText  ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitDataItem: aPRListItem [

	self
		write: aPRListItem
		withTemplateFileName: self dataItemTemplateFileName
		ifAbsent: [ defaultWriter visitDataItem: aPRListItem ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitDefinitionList: aPRList [

	self
		write: aPRList
		withTemplateFileName: self definitionListTemplateFileName
		ifAbsent: [ defaultWriter visitDefinitionList: aPRList ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitEmptyParagraph: anEmptyParagraph [
	
	self
		writeRawText: anEmptyParagraph text
		withTemplateFileName: self emptyParagraphTemplateFileName
		ifAbsent: [ defaultWriter visitEmptyParagraph: anEmptyParagraph ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitEnvironment: anEnvironment [

	self pushEnvironment: anEnvironment.
	self
		write: anEnvironment
		withTemplateFileName: 'main.mustache'
		extraArguments: anEnvironment properties associations
		ifAbsent: [ self visitDocumentGroup: anEnvironment ].
	self popEnvironment.
]

{ #category : #visiting }
PRTemplatedWriter >> visitExternalLink: aPRExternalLink [

	self
		write: aPRExternalLink
		withTemplateFileName: self externalLinkTemplateFileName
		extraArguments: { 'reference' -> aPRExternalLink reference }
		ifAbsent: [ defaultWriter visitExternalLink: aPRExternalLink ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitFigure: aFigure [

	self
		write: aFigure
		withTemplateFileName: self figureTemplateFileName
		extraArguments: {
			'ref' -> aFigure localFileOrExternalReference.
			'caption' -> (aFigure hasChildren ifTrue: [ aFigure text ] ifFalse: [ '' ]) }
		ifAbsent: [ defaultWriter visitFigure: aFigure ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitHeader: aHeader [

	self
		write: aHeader
		withTemplateFileName: self headerTemplateFileName
		extraArguments: { 'level' -> (aHeader level min: 7 max: 1) }
		ifAbsent: [ defaultWriter visitHeader: aHeader ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitHorizontalRule: aPRHorizontalRule [

	self
		writeRawText: ''
		withTemplateFileName: self horizontalRuleTemplateFileName
		ifAbsent: [ defaultWriter visitHorizontalRule: aPRHorizontalRule ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitInternalLink: aPRInternalLink [

	self
		write: aPRInternalLink
		withTemplateFileName: self internalLinkTemplateFileName
		extraArguments: { 'reference' -> aPRInternalLink reference }
		ifAbsent: [ defaultWriter visitInternalLink: aPRInternalLink ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitItalicFormat: aPRItalicFormat [ 
	
	self
		write: aPRItalicFormat
		withTemplateFileName: self italicTemplateFileName
		ifAbsent: [ defaultWriter visitItalicFormat: aPRItalicFormat ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitLineBreak: aPRLineBreak [

	self
		writeRawText: ''
		withTemplateFileName: self lineBreakTemplateFileName
		ifAbsent: [ defaultWriter visitLineBreak: aPRLineBreak ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitListItem: aPRListItem [

	self
		write: aPRListItem
		withTemplateFileName: self listItemTemplateFileName
		ifAbsent: [ defaultWriter visitListItem: aPRListItem ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitMailLink: aPRMailLink [

	self
		write: aPRMailLink
		withTemplateFileName: self mailLinkTemplateFileName
		extraArguments: { 'reference' -> aPRMailLink reference }
		ifAbsent: [ defaultWriter visitExternalLink: aPRMailLink ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitMonospaceFormat: aPRMonospaceFormat [ 
	
	self
		write: aPRMonospaceFormat
		withTemplateFileName: self monospaceTemplateFileName
		ifAbsent: [ defaultWriter visitMonospaceFormat: aPRMonospaceFormat ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitOrderedList: aPROrderedList [

	self
		write: aPROrderedList
		withTemplateFileName: self orderedListTemplateFileName
		ifAbsent: [ defaultWriter visitOrderedList: aPROrderedList ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitParagraph: aParagraph [

	self
		write: aParagraph
		withTemplateFileName: self paragraphTemplateFileName
		ifAbsent: [ defaultWriter visitParagraph: aParagraph ]
]

{ #category : #visiting }
PRTemplatedWriter >> visitPreformatted: aPRPreformatted [

	self
		write: aPRPreformatted
		withTemplateFileName: self preformattedTemplateFileName
		ifAbsent: [ defaultWriter visitPreformatted: aPRPreformatted ]
]

{ #category : #delegating }
PRTemplatedWriter >> visitRaw: aPRRaw [ 
	
	defaultWriter visitRaw: aPRRaw
]

{ #category : #visiting }
PRTemplatedWriter >> visitSection: aPRSection [

	self
		write: aPRSection
		withTemplateFileName: self sectionTemplateFileName
		ifAbsent: [ defaultWriter visitSection: aPRSection ]
]

{ #category : #delegating }
PRTemplatedWriter >> visitText: aPRText [ 
	
	defaultWriter visitText: aPRText
]

{ #category : #visiting }
PRTemplatedWriter >> visitUnorderedList: aPRUnorderedList [ 

	self
		write: aPRUnorderedList
		withTemplateFileName: self unorderedListTemplateFileName
		ifAbsent: [ defaultWriter visitUnorderedList: aPRUnorderedList ]
]

{ #category : #writing }
PRTemplatedWriter >> write: aPRElement [ 
	
	aPRElement accept: self.
	^ defaultWriter contents
]

{ #category : #writing }
PRTemplatedWriter >> write: aDocumentItem withTemplateFileName: templateFileName extraArguments: arguments ifAbsent: aBlock [

	self
		writeRawText: [ | subWriter |
			subWriter := outputDocument writer.
			subWriter environmentStack: environmentStack. 
			subWriter visitDocumentGroup: aDocumentItem.
			subWriter contents ]
		withTemplateFileName: templateFileName
		extraArguments: arguments
		ifAbsent: aBlock
]

{ #category : #writing }
PRTemplatedWriter >> write: aDocumentItem withTemplateFileName: templateFileName ifAbsent: aBlock [

	self
		write: aDocumentItem
		withTemplateFileName: templateFileName
		extraArguments: #()
		ifAbsent: aBlock
]

{ #category : #writing }
PRTemplatedWriter >> writeRawText: aText withTemplateFileName: templateFileName extraArguments: arguments ifAbsent: aBlock [

	| templateFile result environmentPath foundPath |
	environmentPath := self currentEnvironmentPath.
	
	foundPath := environmentPath
		lookup: [ :path | ((outputDocument templateDirectory resolve: path) / templateFileName) exists ]
		ifNone: [ ^ aBlock value ].
	
	templateFile := outputDocument templateDirectory resolve: foundPath / templateFileName.
		
	result := templateFile asMustacheTemplate value: ({ 'contents' -> aText value }, arguments) asDictionary.
	self visitRaw: (PRRaw content: result type: defaultWriter writerName)
]

{ #category : #writing }
PRTemplatedWriter >> writeRawText: aText withTemplateFileName: templateFileName ifAbsent: aBlock [

	^ self
		writeRawText: aText
		withTemplateFileName: templateFileName
		extraArguments: #()
		ifAbsent: aBlock
]
