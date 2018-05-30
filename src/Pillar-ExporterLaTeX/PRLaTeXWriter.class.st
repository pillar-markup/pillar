"
A LaTeX writer
"
Class {
	#name : #PRLaTeXWriter,
	#superclass : #PRDocumentWriter,
	#category : 'Pillar-ExporterLaTeX'
}

{ #category : #accessing }
PRLaTeXWriter class >> fileExtension [
	^ 'tex'
]

{ #category : #accessing }
PRLaTeXWriter class >> writerName [
	^ #latex
]

{ #category : #accessing }
PRLaTeXWriter >> canvasClass [
	^ PRLaTeXCanvas
]

{ #category : #templating }
PRLaTeXWriter >> chapterTemplateName [
	
	^ 'latexChapterTemplate'
]

{ #category : #helpers }
PRLaTeXWriter >> createLinkToLabelWithAlias: anInternalLink [
	canvas command
		name: 'hyperref';
		optParameter: [ canvas nextPutAll: anInternalLink anchor ];
		parameter: [ 
					anInternalLink counter isValidCounter
						ifTrue: [ self writeCounter: anInternalLink counter ].
					canvas nextPutAll: anInternalLink alias ]
]

{ #category : #helpers }
PRLaTeXWriter >> createLinkToLabelWithoutAlias: anInternalLink [
	canvas command
		name: 'ref';
		parameter: [ canvas raw: anInternalLink anchor ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> getLevelFor: aHeader [
	^ aHeader level
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> getTypeOfSectionFor: aHeader [
	| sections level section |
	sections := self sectioningCommands.
	level := self getLevelFor: aHeader.
	section := sections at: (level min: sections size max: 1).
	^ section
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> includeGraphicsFor: aFigure [
	canvas command
		name: 'includegraphics';
		optParameter: [ self writeGraphicsParametersOfExternalLink: aFigure ];
		parameter: [ canvas raw: (aFigure localFileOrExternalReference) ]
]

{ #category : #templating }
PRLaTeXWriter >> mainDocumentTemplateName [
	
	^ 'latexTemplate'
]

{ #category : #protected }
PRLaTeXWriter >> monospaceMacro [
	^ 'code'
]

{ #category : #helpers }
PRLaTeXWriter >> protectUrl: aString [
	^ ((aString copyReplaceAll: '\' with: '\\') copyReplaceAll: '#' with: '\#') copyReplaceAll: '%' with: '\%'
]

{ #category : #helpers }
PRLaTeXWriter >> sectioningCommands [
	^ #('part' 'chapter' 'section' 'subsection' 'subsubsection' 'paragraph' 'subparagraph')
]

{ #category : #templating }
PRLaTeXWriter >> templateForConfiguration: aConfiguration [
	| inputFile templateName |
	configuration := aConfiguration.
	inputFile := configuration inputFile.

	(configuration hasProperty: #mainDocument)
		ifFalse: [ ^ configuration propertyAt: self mainDocumentTemplateName ].

	templateName := inputFile fullName = ((configuration baseDirectory resolve: configuration mainDocument), 'pillar') fullName
		ifTrue: [ self mainDocumentTemplateName ]
		ifFalse: [ self chapterTemplateName ].
		
	^ configuration propertyAt: templateName
]

{ #category : #templating }
PRLaTeXWriter >> templateForContext: aPillarContext [

	^ self templateForConfiguration: aPillarContext configuration
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitAnchor: anAnchor [
	canvas command
		name: 'label';
		parameter: anAnchor name
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
	"Annotations need to be defined as environments in LaTeX include files (e.g. common.tex)"

	canvas environment
		name: anAnnotatedParagraph annotation;
		with: [ super visitParagraph: anAnnotatedParagraph.
			canvas newLine ]
	"Attention: we do a super call on #visitParagraph: instead of #visitAnnotatedParagraph:. The goal of this hack is to avoid trailing new line characters. This is related to PRLaTeXWriterTest>>#testStrictLineBreaksInAnnotatedParagraphs"
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitBoldFormat: aFormat [
	canvas command name: 'textbf'; parameter: [ super visitBoldFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitCitation: aCitation [
	canvas command
		name: 'cite';
		parameter: aCitation ref.

]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitCodeblock: aCodeBlock [
	| env parameters |
	parameters := OrderedCollection new.
	aCodeBlock hasCaption
		ifTrue: [ parameters add: 'caption={' , (self getStringForAll: aCodeBlock caption children), '}' ].
	aCodeBlock hasLabel
		ifTrue: [ parameters add: 'label=' , aCodeBlock label ].
	(self languageForScript: aCodeBlock) isSyntaxHighlightingPossible
		ifTrue:
			[ parameters add: 'language=' , (self languageForScript: aCodeBlock) printString ].
	env := canvas environment
		name: 'listing';
		yourself.
	parameters ifNotEmpty: [ env optParameter: parameters asCommaString ].
	env
		with: [ self writeRawDuring: [ super visitCodeblock: aCodeBlock ].
			canvas newLine ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitDataItem: anItem [
	self visitAll: anItem children.
	canvas newLine.
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitDefinitionList: aList [
	canvas environment
		name: 'description';
		with: [ super visitDefinitionList: aList ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitEmptyParagraph: aParagraph [
	
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitExternalLink: anExternalLink [
	| text reference |
	reference := anExternalLink localFileOrExternalReference.
	text := anExternalLink text.
	(text isEmptyOrNil or: [ reference = text ])
		ifTrue: [ canvas command
				name: 'url';
				parameter: reference ]
		ifFalse: [
			canvas command
				name: 'href';
				parameter: reference;
				parameter: [ canvas nextPutAll: text ].
			canvas command
				name: 'footnote';
				parameter: [ canvas command name: 'url'; parameter: (self protectUrl: reference) ] ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitFigure: aFigure [
	(aFigure hasCaption not and: [ aFigure hasLabel not ])
		ifTrue: [ 
			self includeGraphicsFor: aFigure.
			^ self ].
	canvas environment
		name: 'figure';
		with:
				[ 
			canvas environment
				name: 'center';
				with:
						[ 
					self includeGraphicsFor: aFigure.
					canvas command
						name: 'caption';
						parameter: [ 
							self
								writeCaptionOfExternalLink: aFigure;
								writeLabelOfExternalLink: aFigure ] ] ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitFootnote: aFootnote [
	canvas command name: 'footnote'; parameter: (aFootnote note)
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitHeader: aHeader [
	| section |
	section := self getTypeOfSectionFor: aHeader.
	canvas command
		name: section;
		parameter: [ super visitHeader: aHeader ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitHorizontalRule: anHorizontalRule [

	canvas newLine; newLine.
	canvas raw: '\rule{\textwidth}{0.1pt}'.
	canvas newLine.
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitInternalLink: anInternalLink [
	(anInternalLink reference isNil or: [ self configuration separateOutputFiles not ])
		ifTrue: [ 
			anInternalLink hasAlias
				ifTrue: [ 
					anInternalLink hasAnchor
						ifTrue: [ self createLinkToLabelWithAlias: anInternalLink ]
						ifFalse: [ 
							PRLinkWarning
								signal:
									(PRPillarWriter write: anInternalLink)
										,
											' will not be render because you export without separate output files. If you want your link to be render add an anchor to the beginning of your file.'.
							canvas nextPutAll: anInternalLink alias ] ]
				ifFalse: [ 
					anInternalLink hasAnchor
						ifTrue: [ self createLinkToLabelWithoutAlias: anInternalLink ] ] ]
		ifFalse: [ 
			anInternalLink hasAlias
				ifTrue: [ 
					self flag: #todo.	"If we don't render the link we can put it as Footer. We need to do it."
					canvas nextPutAll: anInternalLink alias ]
				ifFalse: [ 
					PRLinkWarning
						signal:
							(PRPillarWriter write: anInternalLink)
								,
									' will not be exported because LaTeX doesn''t support the inter-files links. Please add an Alias to keep this internal link.' ] ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitItalicFormat: aFormat [
	canvas command name: 'textit'; parameter: [ super visitItalicFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitListItem: anItem [
	canvas command name: 'item'.
	canvas space.
	canvas raw: [ super visitListItem: anItem ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitMailLink: aLink [
	canvas command
		name: 'href';
		parameter: aLink unscrambledUrl;
		parameter: aLink alias
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitMonospaceFormat: aFormat [
	canvas command
		name: self monospaceMacro;
		parameter: [ super visitMonospaceFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitOrderedList: aList [
	canvas environment
		name: 'enumerate';
		with: [ super visitOrderedList: aList ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitParagraph: aParagraph [
	canvas newLine.
	super visitParagraph: aParagraph.
	canvas newLine.
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitPreformatted: aPreformatted [
	canvas environment
		name: 'verbatim';
		with: [ 
					self
						writeRawDuring: [ 
							aPreformatted children
								do: [ :child | 
									self visit: child.
									canvas newLine ] ] ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitStrikethroughFormat: aFormat [
	canvas command name: 'sout'; parameter: [ super visitStrikethroughFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitSubscriptFormat: aFormat [
	canvas command
		name: 'textsubscript';
		parameter: [ super visitSubscriptFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitSuperscriptFormat: aFormat [
	canvas command
		name: 'textsuperscript';
		parameter: [ super visitSuperscriptFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitTable: aTable [
	| environment |
	environment := canvas environment name: 'tabular'.
	aTable rowCount = 0
		ifTrue: [ 
			environment with: [  ].
			^ self ].
	environment parameter: aTable latexSpecification.
	environment
		with: [ 
			canvas command name: 'toprule'.
			canvas newLine.
			super visitTable: aTable.
			canvas command name: 'bottomrule'.
			canvas newLine ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitTableCell: aCell [
	aCell isAligned
		ifFalse: [ self writeTableCellContent: aCell ]
		ifTrue: [ 
			canvas command
				name: 'multicolumn';
				parameter: '1';
				parameter: aCell latexAlignment;
				parameter: [ self writeTableCellContent: aCell ] ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitTableRow: aRow [
	self visitAll: aRow children separatedBy: [ canvas raw: ' & ' ].
	canvas
		raw: ' \\';
		newLine.
	aRow isHeading
		ifTrue: [ 
			canvas command name: 'midrule'.
			canvas newLine ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitTermItem: anItem [
	canvas command
		name: 'item';
		optParameter: [ self visitAll: anItem children ].
	canvas space.
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitUnderlineFormat: aFormat [
	canvas command
		name: 'uline';
		parameter: [ super visitUnderlineFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRLaTeXWriter >> visitUnorderedList: aList [
	canvas environment
		name: 'itemize';
		with: [ super visitUnorderedList: aList ]
]

{ #category : #helpers }
PRLaTeXWriter >> writeCaptionOfExternalLink: anExternalLink [
	self visitAll: anExternalLink children
]

{ #category : #helpers }
PRLaTeXWriter >> writeGraphicsParametersOfExternalLink: anExternalLink [
	canvas
		nextPutAll: 'width=';
		nextPutAll: ((anExternalLink parameters at: 'width' ifAbsent: [ 100 ]) asNumber / 100.0) printString;
		raw: '\textwidth'
]

{ #category : #helpers }
PRLaTeXWriter >> writeLabelOfExternalLink: anExternalLink [
	| label |
	label := anExternalLink parameters at: 'label' ifAbsent: [ anExternalLink localFileOrExternalReference ].
	canvas command
		name: 'label';
		parameter: [ canvas raw: label ]
]

{ #category : #helpers }
PRLaTeXWriter >> writeTableCellContent: aCell [
	^ aCell isHeading
		ifTrue: [ 
			canvas command
				name: 'textbf';
				parameter: [ super visitTableCell: aCell ] ]
		ifFalse: [ super visitTableCell: aCell ]
]
