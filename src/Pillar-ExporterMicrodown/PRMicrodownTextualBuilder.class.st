"
I'm a textual builder of microdown. 
Using my API clients can generate text in Microdown format.

I should replace MicBuilder and probably be moved to Microdown project.
"
Class {
	#name : #PRMicrodownTextualBuilder,
	#superclass : #PRAbstractMicrodownTextualBuilder,
	#instVars : [
		'lastIsNewLine',
		'prefixStack',
		'parserClass'
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

{ #category : #formatting }
PRMicrodownTextualBuilder >> bold: aText [

	self writeText: aText surroundBy: parserClass boldMarkup
]

{ #category : #'code block' }
PRMicrodownTextualBuilder >> codeblock: aString [ 
	self raw: parserClass codeblockMarkup.
	self newLine.
	self raw: aString.
	self newLine.
	self raw: parserClass codeblockMarkup.
]

{ #category : #accessing }
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

{ #category : #'external reference' }
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

{ #category : #elements }
PRMicrodownTextualBuilder >> figure: aFigureUrl withDescription: aDescription [

	self 
		writeText: aDescription 
		surroundBy: parserClass figureOpenerMarkup 
		and: parserClass linkNameCloserMarkup.
	self 
		writeText: aFigureUrl 
		surroundBy: parserClass urlOpenerMarkup 
		and: parserClass urlCloserMarkup
]

{ #category : #header }
PRMicrodownTextualBuilder >> header: aBloc withLevel: anInteger [
	self raw: (parserClass headerMarkup repeat: anInteger).
   self raw: String space.
   aBloc value: self
]

{ #category : #initialization }
PRMicrodownTextualBuilder >> initialize [
	super initialize.
	parserClass := MicroDownParser.
	prefixStack := OrderedCollection new.
	lastIsNewLine := true
]

{ #category : #formatting }
PRMicrodownTextualBuilder >> italic: aText [
	self writeText: aText surroundBy: parserClass italicMarkup
]

{ #category : #accessing }
PRMicrodownTextualBuilder >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #formatting }
PRMicrodownTextualBuilder >> monospace: aText [
	self writeText: aText surroundBy: parserClass monospaceMarkup
]

{ #category : #'writing text' }
PRMicrodownTextualBuilder >> newLine [
	super newLine.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRMicrodownTextualBuilder >> nextPut: aCharacter [
	super nextPut: aCharacter.
	lastIsNewLine := false
]

{ #category : #list }
PRMicrodownTextualBuilder >> orderedList: aText [
	| str i |
	str := aText readStream.
	i := 1.
	[ str atEnd ]
		whileFalse: [ 
			| line |
			line := str nextLine.
			self writeText: line beginsWith: i asString, '.'.
			i := i+1.
			str atEnd
				ifFalse: [self newLine] ]
]

{ #category : #utils }
PRMicrodownTextualBuilder >> popPrefix [
	
	prefixStack removeLast
]

{ #category : #'writing text' }
PRMicrodownTextualBuilder >> potentialNewLine [
	lastIsNewLine ifFalse: [ self newLine ]
]

{ #category : #utils }
PRMicrodownTextualBuilder >> pushPrefix: aString [ 
	
	prefixStack addLast: aString
]

{ #category : #'quote block' }
PRMicrodownTextualBuilder >> quoteBlock: aText [

	self writeText: aText beginsWith: parserClass preformattedMarkup
]

{ #category : #'writing text' }
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

{ #category : #formatting }
PRMicrodownTextualBuilder >> strike: aText [
	self writeText: aText surroundBy: parserClass strikeMarkup
]

{ #category : #writing }
PRMicrodownTextualBuilder >> text: aText [
	self raw: aText
	
]

{ #category : #list }
PRMicrodownTextualBuilder >> unorderedList: aText [
	self 
		withLinesIn: aText 
		do: [ :line | self writeText: line beginsWith: parserClass unorderedListMarkup ] 		
		separatedBy: [ self newLine ]
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeIndentedCodeBlockDuring: aBlockClosure [ 
	"The logic of writeIndentedCodeBlockDuring: only works if the raw: method managing the prefixes
is invoked. Therefore somehow the blockclosure execution should invoke it.
It means that within the context of a visitor the visitText: method should do it."
	
	self
		writePrefix: parserClass preformattedMarkup
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeLinkDuring: aBlockClosure destination: aString [ 
	
	self
		writeLinkDuring: aBlockClosure
		destination: aString
		title: nil
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeLinkDuring: aBlockClosure destination: aDestination title: aTitle [ 

	self raw: '['.
	aBlockClosure ensure: [ 
		self
			raw: '](';
			raw: aDestination.
		
		aTitle ifNotNil: [ 
			self
				raw: ' "';
				raw: aTitle;
				raw: '"'.
		].
		self raw: ')'
	 ]
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeNewLine [
	self raw: String cr
	
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeOrderedListIndex: anInteger [
	self raw: anInteger asString, '. '
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writePrefix: aString forEachLineDuring: aBlockClosure [ 
	"The logic of writePrefix:forEachLineDuring: only works if the raw: method managing the prefixes
is invoked. Therefore somehow the blockclosure execution should invoke it.
It means that within the context of a visitor the visitText: method should do it."
	self pushPrefix: aString.
	aBlockClosure ensure: [ self popPrefix ].
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeQuoteCodeBlockDuring: aBlockClosure [ 
	"The logic of writePrefix:forEachLineDuring: only works if the raw: method managing the prefixes
is invoked. Therefore somehow the blockclosure execution should invoke it.
It means that within the context of a visitor the visitText: method should do it."
	self
		writePrefix: parserClass preformattedMarkup, String space
		forEachLineDuring: aBlockClosure
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeText: aText beginsWith: aMarkup [
	self
		raw: aMarkup;
		raw: String space;
		raw: aText
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeText: aText surroundBy: aMarkup [
	self writeText: aText surroundBy: aMarkup and: aMarkup
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeText: aText surroundBy: anOpenerMarkup and: aCloserMarkup [
	self
		raw: anOpenerMarkup;
		raw: aText;
		raw: aCloserMarkup
]

{ #category : #writing }
PRMicrodownTextualBuilder >> writeUnorderedListDuring: aBlockClosure [
	self
		writePrefix: parserClass unorderedListMarkup , String space
		forEachLineDuring: aBlockClosure
]
