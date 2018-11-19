"
Writes a Pillar document as HTML.
"
Class {
	#name : #PRHTMLWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'footnoteID',
		'noteDictionary'
	],
	#category : 'Pillar-ExporterHTML'
}

{ #category : #accessing }
PRHTMLWriter class >> fileExtension [
	^ 'html'
]

{ #category : #accessing }
PRHTMLWriter class >> folderName [
	^ #html
]

{ #category : #accessing }
PRHTMLWriter class >> writerName [
	^ #html
]

{ #category : #private }
PRHTMLWriter >> addAnchorFrom: anInternalLink To: href [
	"I am here for the deck.js exporter or other exporter that would need to change the way anchor are generated."

	^ href , '#' , anInternalLink anchor
]

{ #category : #accessing }
PRHTMLWriter >> canvas [
	
	^ canvas
]

{ #category : #accessing }
PRHTMLWriter >> canvasClass [
	^ PRHTMLCanvas
]

{ #category : #templating }
PRHTMLWriter >> chapterTemplateName [
	^ 'htmlChapterTemplate'
]

{ #category : #private }
PRHTMLWriter >> createAnchorWith: anId [
	canvas tag
		name: 'a';
		parameterAt: 'id' put: anId;
		with: ''
]

{ #category : #private }
PRHTMLWriter >> exportImgFor: aFigure [
	| img |
	img := canvas emptyTag
		name: 'img';
		parameterAt: 'src' put: (aFigure localFileOrExternalReference);
		yourself.
	aFigure parameters
		at: 'width'
		ifPresent: [ :width | img parameterAt: 'width' put: width asString , '%' ].
	aFigure hasLabel ifTrue:[
		img
			parameterAt: 'id'
			put: aFigure label ].
	img
		parameterAt: 'alt'
		put: (aFigure hasChildren ifTrue: [ aFigure text ] ifFalse: [ '' ]).
	img closeTag
]

{ #category : #private }
PRHTMLWriter >> internalLinkWillBeRender: anInternalLink [
	(anInternalLink hasReference and: [ anInternalLink hasAnchor not ])
		ifTrue: [ 
			PRLinkWarning
				signal:
					'Your inter-file link will not be rendered because you export without separate output files. If you want your link to be rendered add an anchor to the beginning of your file.' ]
]

{ #category : #private }
PRHTMLWriter >> noteAtEnd [
	self noteDictionary isNotEmpty
		ifTrue: [ canvas newLine.
			canvas tag
				name: 'hr';
				with: ''.
			canvas newLine ].
	self noteDictionary
		keysAndValuesDo: [ :keys :value | 
			canvas tag
				name: 'sup';
				parameterAt: 'id' put: 'footnote' , keys asString;
				with: '[' , keys asString , '] ' , value.
			canvas emptyTag
				name: 'br';
				closeTag.
			canvas newLine ]
]

{ #category : #accessing }
PRHTMLWriter >> noteDictionary [
	^ noteDictionary
]

{ #category : #visiting }
PRHTMLWriter >> start: anObject [
	canvas := PRHTMLCanvas on: stream.
	footnoteID := 0.
	noteDictionary := Dictionary new.
	super start: anObject.
	self noteAtEnd.
	canvas flush
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitAnchor: anAnchor [
	self createAnchorWith: anAnchor name
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
	"Annotations need to be defined as CSS styles. For example...
		@@note 
		@@dothis
	could have...
	 	<head><style>
		p.note{colour:green}
		p.dothis{colour:red}
		</style></head> 
	"

	canvas tag
		name: 'p';
		parameterAt: 'class' put: anAnnotatedParagraph annotation;
		with: [ 
					"We call #visitParagraph: directly because we don't want 'self visitParagraph:' to be executed."
					super visitParagraph: anAnnotatedParagraph ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitBoldFormat: aFormat [
	canvas tag
		name: 'strong';
		with: [ super visitBoldFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitCodeblock: aCodeBlock [
	canvas tag
		name: 'figure';
		with: [ 
					canvas tag
						name: 'pre';
						with: [ 
									| code language |
									code := canvas tag
										name: 'code';
										yourself.
									language := self languageForScript: aCodeBlock.
									language isSyntaxHighlightingPossible
										ifTrue: [ code parameterAt: 'class' put: language printString ].
									code with: [ canvas lines: aCodeBlock text ] ].
					canvas tag
						name: 'figcaption';
						with: [ 
									aCodeBlock hasLabel
										ifTrue: [ 
											self createAnchorWith: aCodeBlock label.
											self writeCounterForScript: aCodeBlock ].
									aCodeBlock hasCaption
										ifTrue: [ self visitAll: aCodeBlock caption children ] ] ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitColumn: aColumn [
	canvas tag
		name: 'div';
		parameterAt: 'class' put: 'column';
		parameterAt: 'style' put: 'float:left; margin:0; width:' , aColumn width asString , '%;';
		with: [ super visitColumn: aColumn ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitColumns: aColumns [
	canvas tag
		name: 'div';
		parameterAt: 'class' put: 'columns';
		parameterAt: 'style' put: 'margin:0px auto; width:100%';
		with: [ super visitColumns: aColumns ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitDataItem: anItem [
	canvas tag
		name: 'dd';
		with: [ self visitAll: anItem children ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitDefinitionList: aList [
	canvas tag
		name: 'dl';
		with: [ super visitDefinitionList: aList ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitExternalLink: anExternalLink [
	canvas tag
		name: 'a';
		parameterAt: 'href' put: anExternalLink localFileOrExternalReference;
		with: anExternalLink alias
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitFigure: aFigure [
	(aFigure hasLabel not and: [ aFigure hasCaption not ])
		ifTrue: [ 
			self exportImgFor: aFigure.
			^ self ].
	aFigure label ifNotNil: [ :label | self createAnchorWith: label ].
	canvas newLine.
	canvas tag
		name: 'figure';
		with:
				[ 
			canvas newLine.
			canvas nextPut: Character tab.
			self exportImgFor: aFigure.
			canvas newLine.
			canvas nextPut: Character tab.
			canvas tag
				name: 'figcaption';
				with:
						[ 
					aFigure label ifNotNil: [ self writeCounterForFigure: aFigure ].
					super visitFigure: aFigure ].
			canvas newLine ]
]

{ #category : #'visiting-annotations' }
PRHTMLWriter >> visitFootnote: aFootnote [
	footnoteID := footnoteID + 1.
	canvas tag
		name: 'sup';
		with: [ canvas tag
				name: 'a';
				parameterAt: 'href' put: '#footnote' , footnoteID asString;
				with: '[' , footnoteID asString , ']' ].
	noteDictionary at: footnoteID ifAbsentPut: aFootnote note
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitHeader: aHeader [
	| level |
	"h1 to h7 exist."
	level := aHeader level min: 7 max: 1.
	canvas tag
		name: 'h' , level asString;
		with: [ 
					self writeCounterForHeader: aHeader.
					super visitHeader: aHeader ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitHorizontalRule: anHorizontalRule [

	canvas newLine; newLine.
	canvas raw: '<hr>'.
	canvas newLine.
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitInternalLink: anInternalLink [
	| href |
	href := String new.
	anInternalLink hasReference
		ifTrue: [ href := href , anInternalLink referenceAsHTML ].
	anInternalLink hasAnchor
		ifTrue: [ href := self addAnchorFrom: anInternalLink To: href ].
	canvas tag
		name: 'a';
		parameterAt: 'href' put: href;
		with: [ 
					anInternalLink counter isValidCounter
						ifTrue: [ 
							self writeCounter: anInternalLink counter.
							anInternalLink hasAlias
								ifTrue: [ canvas nextPutAll: ' ' ] ].
					super visitInternalLink: anInternalLink ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitItalicFormat: aFormat [
	canvas tag
		name: 'em';
		with: [ super visitItalicFormat: aFormat ]

]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitListItem: anItem [
	canvas tag
		name: 'li';
		with: [ super visitListItem: anItem ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitMailLink: aLink [
	canvas tag
		name: 'a';
		parameterAt: 'href' put: aLink unscrambledUrl;
		with: aLink alias
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitMonospaceFormat: aFormat [
	canvas tag
		name: 'code';
		with: [ super visitBoldFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitOrderedList: aList [
	canvas tag
		name: 'ol';
		with: [ super visitOrderedList: aList ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitParagraph: aParagraph [
	(aParagraph children size = 1 and: [ aParagraph children first isKindOf: PRRaw ])
		ifTrue: [ 
			self
				flag:
					'TODO: ugly fix. The idea is that you don''t want the <p> when using a Raw that potentially displays a <div>, because this is not HTML compliant'.
			self visitRaw: aParagraph children first ]
		ifFalse: [ 
			canvas tag
				name: 'p';
				with: [ 
							canvas newLine.
							super visitParagraph: aParagraph.
							canvas newLine ] ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitPreformatted: aPreformatted [
	canvas tag
		name: 'pre';
		with: [ aPreformatted children do: [ :child | self visit: child ] separatedBy: [ canvas newLine ] ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitSection: aSection [
	canvas tag
		name: 'section';
		with: [ 
					canvas newLine.
					super visitSection: aSection ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitStrikethroughFormat: aFormat [
	canvas tag
		name: 's';
		with: [ super visitStrikethroughFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitSubscriptFormat: aFormat [
	canvas tag
		name: 'sub';
		with: [ super visitSubscriptFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitSuperscriptFormat: aFormat [
	canvas tag
		name: 'sup';
		with: [ super visitSuperscriptFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitTable: aTable [
	canvas tag
		name: 'table';
		parameterAt: 'style' put: 'border: solid thin';
		with: [ super visitTable: aTable ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitTableCell: aCell [
	| tagName tag |
	tagName := aCell isHeading
		ifTrue: [ 'th' ]
		ifFalse: [ 'td' ].
	tag := canvas tag name: tagName.
	aCell isAligned
		ifTrue: [ 
			aCell isAlignedLeft
				ifTrue: [ tag parameterAt: 'style' put: 'text-align: left' ].
			aCell isAlignedCenter
				ifTrue: [ tag parameterAt: 'style' put: 'text-align: center' ].
			aCell isAlignedRight
				ifTrue: [ tag parameterAt: 'style' put: 'text-align: right' ] ].
	tag with: [ super visitTableCell: aCell ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitTableRow: aRow [
	canvas tag
		name: 'tr';
		with: [ super visitTableRow: aRow ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitTermItem: anItem [
	canvas tag
		name: 'dt';
		with: [ self visitAll: anItem children ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitUnderlineFormat: aFormat [
	canvas tag
		name: 'u';
		with: [ super visitUnderlineFormat: aFormat ]
]

{ #category : #'visiting-document' }
PRHTMLWriter >> visitUnorderedList: aList [
	canvas tag
		name: 'ul';
		with: [ 
					canvas newLine.
					super visitUnorderedList: aList ].
	canvas newLine
]

{ #category : #writing }
PRHTMLWriter >> writeParagraphDuring: aBlockClosure [ 
	
	canvas tag
		name: 'p';
		with: [ 
			canvas newLine.
			aBlockClosure value.
			canvas newLine ]
]

{ #category : #accessing }
PRHTMLWriter >> writerFor: aPRPillarConfiguration [ 
	
	^ (PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = (aPRPillarConfiguration propertyAt: #htmlWriter) ] ])
				new
]
