"
I'm a pillar visitor converting a pillar tree to microdown exporter text.


The current strategy is that there is one line separating every elements of the document. 
But we do not have enough information (such as am I the latest of the list and is my container another list or the root document) to control the fact that we should not emit a newline for the last item.
Therefore we generate an extra line while ideally it should not be the case.


#### Known todo or limits  
- externallink url is printing / and we should check it.
- externallink should be tested with real URL.
"
Class {
	#name : #PRMicrodownWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting'
	],
	#pools : [
		'MicroSharedPool'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
PRMicrodownWriter class >> fileExtension [
	^ 'mic'
]

{ #category : #accessing }
PRMicrodownWriter class >> folderName [
	"This method is for decoupling the writer from its physical representation.
	It represents the physical folder name in the archetype, used when this writer is specified.
	For example your writerName can be latex:sbabook but the corresponding folderName is latex"
	^ 'Microdown'
]

{ #category : #accessing }
PRMicrodownWriter class >> writerName [
	"Each writer define this to know the appropriate files to take for process. This one is different from folderName which corresponds to the physical representation. See folderName"
	^ 'Microdown'
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> backSlashString: aString [

	^ String streamContents: [ :st | 
		aString doWithIndex: [ :each :i | 
			((Delimiters includes: each asString) or:
				 (Delimiters includes:
					  each asString , (aString at: (i + 1 min: aString size)) asString)) 
			ifTrue: [ st nextPutAll: '\' ].
		st nextPutAll: each asString ]]
]

{ #category : #accessing }
PRMicrodownWriter >> canvasClass [
	^ MicMicrodownTextualBuilder
]

{ #category : #accessing }
PRMicrodownWriter >> canvasSetLF [
	canvas setNewLineCharacterString: String lf.
]

{ #category : #accessing }
PRMicrodownWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitAnchor: anAnchor [

 	canvas anchor: anAnchor name
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitAnnotatedParagraph: anAnnotatedParagraph [
	"!!label paragraph
	And Paragraph keeps going here"
	canvas annotatedAnnotation: anAnnotatedParagraph annotation.
	self visitParagraph: anAnnotatedParagraph
	
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitBoldFormat: aFormat [

	canvas bold: [aFormat children do: [:each |each accept: self]]
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitChildrenWithoutBackslash: aChildren [
	aChildren do: [ :each | self visitTextWithoutBackslash: each ]
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitCodeblock: aCodeBlock [ 
	
	"the only parameter that could be contain a Pillar element is the caption so let us treat separately"
	| microdownizedCaption parameters caption |
	parameters := aCodeBlock parameters .
	"aCodeBlock hasCaption is not working well so use the accessor"
	caption := aCodeBlock caption.
	caption text isEmpty
		ifFalse: [ microdownizedCaption := self class new start: caption; contents.
					parameters at: 'caption' put: microdownizedCaption].
				
	"may be we should change the builder to accept an orderedDictionary so that we can just change the caption."
	canvas codeblock: aCodeBlock text firstLineAssociations: parameters associations.
	
]

{ #category : #'visiting - slides' }
PRMicrodownWriter >> visitColumn: aColumn [
	canvas columnWidth: aColumn width asString withBody: [ self visitDocumentGroup: aColumn ]
]

{ #category : #'visiting - slides' }
PRMicrodownWriter >> visitColumns: aColumns [

	canvas columnsWithBody: [ self visitDocumentGroup: aColumns ]
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitCommentedLine: aCommentedLine [
	canvas comment: aCommentedLine text
]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitDataItem: aDataItem [
	self visitAll: aDataItem children
]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitDefinitionList: aDefinitionList [
	aDefinitionList children do: [ :child | 
		child accept: self ]
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitDocument: aDocument [
	aDocument children
		do: [ :child | self visit: child ]
		separatedBy: [ canvas newLine ]
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitEmptyParagraph: aParagraph [
	"canvas potentialNewLine"

]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitExternalLink: anExternalLink [

	canvas
		externalLink: (self withoutFileColumnColumn: anExternalLink reference)
		withDescription: [ canvas text: (self backSlashString: anExternalLink text) ]
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitFigure: aFigure [

	canvas figureURLString: (self withoutFileColumnColumn: aFigure reference)
		withCaption: [ aFigure children do: [:each | each accept: self]] 
		withParameters: aFigure parameters
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitHeader: aHeader [
	| level |
	level := aHeader level min: 6 max: 1.
	canvas rawHeader:  [ super visitHeader: aHeader ] withLevel: level.
	canvas newLine
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitHorizontalRule: anHorizontalLine [

	canvas horizontalLine
]

{ #category : #visiting }
PRMicrodownWriter >> visitInputFileAnnotation: anInput [
    | newParameters |

	 canvas raw: EnvironmentOpeningBlockMarkup.
    canvas raw: 'inputFile'.
    anInput parameters ifNotEmpty: [ canvas raw: '|' ].
    newParameters := anInput parameters copy.
    newParameters
        at: 'path'
        ifPresent: [ :pathString | | newPath |
            newPath := (Path from: (self withoutFileColumnColumn: pathString)) withExtension: 'md'.
            newParameters at: 'path' put: newPath pathString ].
    newParameters keysAndValuesDo: [ :key :value | 
        canvas
            raw: key asString;
            raw: '=';
            raw: value asString.
        anInput parameters keys last = key ifFalse: [ canvas raw: '&' ] ].
	 canvas newLine.
    canvas raw: EnvironmentClosingBlockMarkup

]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitInternalLink: anInternalLink [
	"Corresponding to *@fig1* in Pillar"
	
	canvas internalLink: anInternalLink anchor 
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitItalicFormat: aFormat [
	canvas italic: [aFormat children do: [:each |each accept: self]]
]

{ #category : #visiting }
PRMicrodownWriter >> visitListItem: anObject [

	^ self visitDocumentGroup: anObject
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitMathEnvironment: aMathEnv [

    canvas mathblock: aMathEnv text
]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitMathInline: aMathLine [
    | text |
    text := aMathLine text.
    text := text copyFrom: 2 to: (text size - 1). 
    canvas mathInline: text
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitMetadata: aMetaData [

	canvas metaDataFrom: aMetaData metaData
	
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitMonospaceFormat: aFormat [
	canvas monospace: [self visitChildrenWithoutBackslash: aFormat children]
]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitOrderedList2: anOrderedList [

	| i |
	i := 1.
	anOrderedList children
			do: [ :child | 
				canvas writeStartOfOrderedListIndex: i.
				i := i + 1. 
				self visit: child ]
			separatedBy: [ canvas newLine ]
]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitOrderedList: anOrderedList [

	canvas orderedListDuring: [
		anOrderedList children
			do: [ :child | canvas orderedItem: [ self visit: child ] ] ]
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitParagraph: aParagraph [

	aParagraph children do: [ :each | self visit: each ].
	"canvas potentialNewLine."
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitPreformatted: aPreformatted [

	canvas writeQuoteCodeBlockDuring: [
		aPreformatted children
			do: [ :child | self visit: child ]
			separatedBy: [ canvas newLine ] ]
]

{ #category : #'visiting-document' }
PRMicrodownWriter >> visitRaw: aRaw [

	| text |
	text := aRaw text trimBoth.

	((text beginsWith: '[') and: [ text endsWith: ']' ])
		ifTrue: [ self visitMathEnvironment: aRaw ]
		ifFalse: [ 
			((text beginsWith: '$') and: [ text endsWith: '$' ])
				ifTrue: [ self visitMathInline: aRaw ]
				ifFalse: [ 
					(aRaw isForType: self writerName) ifTrue: [ 
						self writeRawDuring: [ super visitRaw: aRaw ] ] ] ]
]

{ #category : #'visiting - slides' }
PRMicrodownWriter >> visitSlide: aPRSlide [

	canvas slideTitle: aPRSlide title withBody: [ self visitDocumentGroup: aPRSlide ]
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitStrikethroughFormat: aFormat [
	canvas strike: [aFormat children do: [:each |each accept: self]]
]

{ #category : #visiting }
PRMicrodownWriter >> visitTable: aTable [
	self visitAll: aTable children
]

{ #category : #visiting }
PRMicrodownWriter >> visitTableCell: aTableRow [
	canvas cell: [self visitAll: aTableRow children] 
	
]

{ #category : #visiting }
PRMicrodownWriter >> visitTableRow: aTableRow [
	canvas newLine.
	self visitAll: aTableRow children.
	canvas raw: '|'.
	aTableRow isHeading 
		ifTrue:[ canvas newLine.
			aTableRow children do: [ :each | canvas headCell ].
				canvas raw: '|' ]

]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitTermItem: aTermItem [
	canvas newLine.
	canvas newLine.
	self visitAll: aTermItem children.
	canvas newLine
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitText: aText [

	canvas raw: (self backSlashString: aText text)
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitTextWithoutBackslash: aText [
	canvas text: aText text
]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitUnorderedList: anUnorderedList [
	"We do not have enough information (such as am I the latest of the list and is my container another list or the root document) to control the fact that we should not emit a newline for the last item."
	
	
	canvas unorderedListDuring: [
		anUnorderedList children
			do: [ :child | canvas item: [self visit: child ] ] ]
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> withoutFileColumnColumn: aString [

	| figref |
	figref := aString.
	(figref beginsWith: 'file://') ifTrue: [ figref :=  aString allButFirst: 7 ].
	^ figref
	
]

{ #category : #writing }
PRMicrodownWriter >> writeParagraphDuring: aBlockClosure [ 
	
	canvas rawParagraph: aBlockClosure
]
