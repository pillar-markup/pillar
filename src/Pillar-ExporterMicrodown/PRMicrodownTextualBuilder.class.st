"
I'm a textual builder of microdown. 
Using my API clients can generate text in Microdown format.

I should replace MicBuilder and probably be moved to Microdown project.
"
Class {
	#name : #PRMicrodownTextualBuilder,
	#superclass : #PRAbstractMicrodownTextualBuilder,
	#instVars : [
		'prefixStack'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #annotated }
PRMicrodownTextualBuilder >> annotated: annotation paragraph:  aText [
	"!!Important 
	
	attention there is not space between the !! and the label (annotation in pillar) or we should improve the microdown parser"

	self
		raw: parserClass annotatedParagraphMarkup;
		raw: annotation; 
		raw: String space;
		raw: aText

]

{ #category : #annotated }
PRMicrodownTextualBuilder >> annotatedAnnotation: annotation [
	"I'm made to be followed by a paragraph. I manage the space between the annotation/label and the paragraph."
	
	"!!Important there is not space between the !! and the label (annotation in pillar) or we should improve the microdown parser"
	self
		raw: parserClass annotatedParagraphMarkup;
		raw: annotation;
		raw: String space
	

]

{ #category : #'code block' }
PRMicrodownTextualBuilder >> codeblock: aString [ 
	self flag: #fixme. 
	"missing first line stuff"
	self raw: parserClass codeblockMarkup.
	self newLine.
	self raw: aString.
	self newLine.
	self raw: parserClass codeblockMarkup.
]

{ #category : #header }
PRMicrodownTextualBuilder >> comment: aText [
	self 
		withLinesIn: aText 
		do: [ :line | self writeText: line beginsWith: (parserClass commentedLineMarkup), String space ] 		separatedBy: [ self newLine ]
	
]

{ #category : #accessing }
PRMicrodownTextualBuilder >> contents [
	^ stream contents
]

{ #category : #header }
PRMicrodownTextualBuilder >> duringHeaderLevel: anInteger do: aBlockClosure [ 

	self
		raw: (parserClass headerMarkup repeat: anInteger);
		raw: String space.
	aBlockClosure value
]

{ #category : #references }
PRMicrodownTextualBuilder >> externalLink: aURL withDescription: aDescription [
	self 
		writeText: aDescription 
		surroundBy: parserClass linkNameOpenerMarkup 
		and: parserClass linkNameCloserMarkup.
	self 
		writeText: aURL 
		surroundBy: parserClass urlOpenerMarkup 
		and: parserClass urlCloserMarkup
]

{ #category : #figure }
PRMicrodownTextualBuilder >> figure: aFigureUrl withDescription: aDescription [
	self flag: #fixme.
	"missing parameter and need a builder like in header."
	self 
		writeText: aDescription 
		surroundBy: parserClass figureOpenerMarkup 
		and: parserClass linkNameCloserMarkup.
	self 
		writeText: aFigureUrl 
		surroundBy: parserClass urlOpenerMarkup 
		and: parserClass urlCloserMarkup
]

{ #category : #figure }
PRMicrodownTextualBuilder >> figure: aFigureUrl withDescription: aDescription withParameters: aZnDictionary [
	| stringToAdd |
	aZnDictionary ifEmpty: [ self figure: aFigureUrl withDescription: aDescription ] ifNotEmpty: [
		stringToAdd := String empty.
		aZnDictionary keysAndValuesDo: [ :key :value | stringToAdd := stringToAdd, parserClass argumentListDelimiter, key asString, parserClass argumentListEqualsDelimiter, value asString ].
		stringToAdd := parserClass argumentListStartDelimiter, stringToAdd allButFirst.
		self figure: aFigureUrl, stringToAdd withDescription: aDescription ]
]

{ #category : #header }
PRMicrodownTextualBuilder >> header: aBloc withLevel: anInteger [
	self raw: (parserClass headerMarkup repeat: anInteger).
   self raw: String space.
   aBloc value: self
]

{ #category : #header }
PRMicrodownTextualBuilder >> horizontalLine [
	self raw: parserClass horizontalLineMarkup.
   self newLine

]

{ #category : #initialization }
PRMicrodownTextualBuilder >> initialize [
	super initialize.
	prefixStack := OrderedCollection new.
	
]

{ #category : #references }
PRMicrodownTextualBuilder >> internalLink: aLabel [
	self 
		writeText: aLabel 
		surroundBy: parserClass anchorReferenceOpenerMarkup 
		and: parserClass anchorReferenceCloserMarkup.
	
]

{ #category : #list }
PRMicrodownTextualBuilder >> item: aBlock [

	aBlock value
]

{ #category : #'ugly line handling' }
PRMicrodownTextualBuilder >> lines: aString [
	"Output aString and take care of line ending within aString."
	| str |
	str := aString readStream.
	[ str atEnd ] whileFalse: [ | line |
		line := str nextLine.
		str atEnd
			ifTrue: [ self nextPutAll: line ]
			ifFalse: [ self line: line ]
	 ]
]

{ #category : #'ugly line handling' }
PRMicrodownTextualBuilder >> nextPutAllLines: aString [
	self 
		withLinesIn: aString 
		do: [ :line | self nextPutAll: line ] 
		separatedBy: [ self newLine ]
]

{ #category : #list }
PRMicrodownTextualBuilder >> orderedListDuring: aBlockClosure [
	"For list we do not emit empty line at the end because we do not want to force the creation of a paragraph 
	in the middle of nested list. And from a builder point of view this is difficult to know it."
	
	
	self
		writePrefix: parserClass orderedListSemiMarkup
		forEachLineDuring: [ |i|
									i := 1.
									self writeOrderedListIndex: i.
									aBlockClosure value.
									i := i + 1].
		
]

{ #category : #'private utils' }
PRMicrodownTextualBuilder >> popPrefix [
	
	prefixStack removeLast
]

{ #category : #'private utils' }
PRMicrodownTextualBuilder >> pushPrefix: aString [ 
	
	prefixStack addLast: aString
]

{ #category : #'quote block' }
PRMicrodownTextualBuilder >> quoteBlock: aText [

	self writeText: aText beginsWith: parserClass preformattedMarkup
]

{ #category : #'writing low-level' }
PRMicrodownTextualBuilder >> raw: aString [
	"We have in the prefix potentially many nesting level '> ', '```' and for each new line 
	we want to make sure that prefixes are written prior to aString.
	
	Now lastIsNewLine indicates that we should only do that for new line since 
	raw can be invoked for multiple reasons. Now the logic of writeIndentedCodeBlockDuring: only works if 
	this raw is invoked. 
	"
	lastIsNewLine ifTrue: [ 
		prefixStack do: [ :each |
			super raw: each ].
	].
	super raw: aString.
	lastIsNewLine := false
]

{ #category : #'ugly line handling' }
PRMicrodownTextualBuilder >> rawLines: aString [
	"Output aString and take care of line ending within aString."
	self withLinesIn: aString do: [ :line | self raw: line ] separatedBy: [ self newLine ]
]

{ #category : #list }
PRMicrodownTextualBuilder >> unorderedListDuring: aBlockClosure [
	"For list we do not emit empty line at the end because we do not want to force the creation of a paragraph 
	in the middle of nested list. And from a builder point of view this is difficult to know it."
	self
		writePrefix: parserClass unorderedListMarkup
		forEachLineDuring: aBlockClosure.
]

{ #category : #'ugly line handling' }
PRMicrodownTextualBuilder >> withLinesIn: aString do: aBlock separatedBy: anotherBlock [
	"this method shows that the PRCommentedLine class is weak because it should encapsulate the way it internally represents lines. Now this is exposed in clients."
	| str |
	str := aString readStream.
	[ str atEnd ]
		whileFalse: [ 
			| line |
			line := str nextLine.
			aBlock value: line.
			str atEnd
				ifFalse: anotherBlock ]
]

{ #category : #'writing during' }
PRMicrodownTextualBuilder >> writeIndentedCodeBlockDuring: aBlockClosure [ 
	"The logic of writeIndentedCodeBlockDuring: only works if the raw: method managing the prefixes
is invoked. Therefore somehow the blockclosure execution should invoke it.
It means that within the context of a visitor the visitText: method should do it."
	
	self
		writePrefix: parserClass preformattedMarkup
		forEachLineDuring: aBlockClosure.
]

{ #category : #list }
PRMicrodownTextualBuilder >> writeOrderedListIndex: anInteger [
	self raw: anInteger asString, parserClass orderedListSemiMarkup
]

{ #category : #'writing during' }
PRMicrodownTextualBuilder >> writePrefix: aString forEachLineDuring: aBlockClosure [ 
	"The logic of writePrefix:forEachLineDuring: only works if the raw: method managing the prefixes
is invoked. Therefore somehow the blockclosure execution should invoke it.
It means that within the context of a visitor the visitText: method should do it."
	self pushPrefix: aString.
	aBlockClosure ensure: [ self popPrefix ].
]

{ #category : #'writing during' }
PRMicrodownTextualBuilder >> writeQuoteCodeBlockDuring: aBlockClosure [ 
	"The logic of writePrefix:forEachLineDuring: only works if the raw: method managing the prefixes
is invoked. Therefore somehow the blockclosure execution should invoke it.
It means that within the context of a visitor the visitText: method should do it."
	self
		writePrefix: parserClass preformattedMarkup, String space
		forEachLineDuring: aBlockClosure
]
