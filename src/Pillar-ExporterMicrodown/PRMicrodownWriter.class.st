"
I'm an pillar to microdown exporter.

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

{ #category : #accessing }
PRMicrodownWriter >> canvasClass [
	^ MicMicrodownTextualBuilder
]

{ #category : #accessing }
PRMicrodownWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject
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

	canvas bold: aFormat text
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitCodeblock: aCodeBlock [ 

	canvas codeblock: aCodeBlock text
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitCommentedLine: aCommentedLine [
	canvas comment: aCommentedLine text
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

	canvas externalLink: anExternalLink reference printString withDescription: anExternalLink text
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitFigure: aFigure [
	| figureName figureLink |
	figureName := aFigure text.
	figureLink := aFigure reference path.
	canvas figure: figureLink withDescription: figureName withParameters: aFigure parameters
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitHeader: aHeader [
	| level |
	level := aHeader level min: 6 max: 1.
	canvas rawHeader:  [ :b| super visitHeader: aHeader ] withLevel: level.
	canvas newLine
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitHorizontalRule: anHorizontalLine [

	canvas horizontalLine
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitInternalLink: anInternalLink [
	"Corresponding to *@fig1* in Pillar"
	
	canvas internalLink: anInternalLink anchor 
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitItalicFormat: aFormat [
	canvas italic: aFormat text
]

{ #category : #'visiting - document' }
PRMicrodownWriter >> visitMetadata: aMetaData [

	canvas metaDataFrom: aMetaData metaData
	
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitMonospaceFormat: aFormat [
	canvas monospace: aFormat text
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
PRMicrodownWriter >> visitOrderedList: anUnorderedList [

	canvas orderedListDuring: [
		anUnorderedList children
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

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitStrikethroughFormat: aFormat [
	canvas strike: aFormat text
]

{ #category : #'visiting - formatting' }
PRMicrodownWriter >> visitText: aText [
	
	canvas raw: aText text
]

{ #category : #'visiting - list' }
PRMicrodownWriter >> visitUnorderedList: anUnorderedList [
	"We do not have enough information (such as am I the latest of the list and is my container another list or the root document) to control the fact that we should not emit a newline for the last item."
	canvas unorderedListDuring: [
		anUnorderedList children
			do: [ :child | canvas item: [self visit: child ] ] ]
]

{ #category : #writing }
PRMicrodownWriter >> writeParagraphDuring: aBlockClosure [ 
	
	canvas rawParagraph: aBlockClosure
]
