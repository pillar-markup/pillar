Class {
	#name : #PRMicrodownCanvas,
	#superclass : #PRAbstractMicrodownBuilderCanvas,
	#instVars : [
		'lastIsNewLine',
		'prefixStack',
		'parserClass'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #annotated }
PRMicrodownCanvas >> annotated: aText [
	"!!Important there is not space between the !! and the label (annotation in pillar) or we should improve the microdown parser"
	self flag: #Laurine. 
	self
		raw: parserClass annotatedParagraphMarkup;
		raw: aText
	

]

{ #category : #annotated }
PRMicrodownCanvas >> annotated: annotation paragraph:  aText [
	"!!Important 
	
	attention there is not space between the !! and the label (annotation in pillar) or we should improve the microdown parser"

	self
		raw: parserClass annotatedParagraphMarkup;
		raw: annotation; 
		raw: String space;
		raw: aText
	

]

{ #category : #annotated }
PRMicrodownCanvas >> annotatedAnnotation: annotation [
	"I'm made to be followed by a paragraph. I manage the space between the annotation/label and the paragraph."
	
	"!!Important there is not space between the !! and the label (annotation in pillar) or we should improve the microdown parser"
	self
		raw: parserClass annotatedParagraphMarkup;
		raw: annotation;
		raw: String space
	

]

{ #category : #formatting }
PRMicrodownCanvas >> bold: aText [

	self writeText: aText surroundBy: parserClass boldMarkup
]

{ #category : #formatting }
PRMicrodownCanvas >> boldish: aString [
	"Return a text decorated as bold. 
	Does not change the receiver."
	^ parserClass boldMarkup, aString, parserClass boldMarkup
]

{ #category : #accessing }
PRMicrodownCanvas >> comment: aTextLine [
	self writeText: aTextLine beginsWith: (parserClass commentedLineMarkup), String space
]

{ #category : #accessing }
PRMicrodownCanvas >> contents [
	^ stream contents
]

{ #category : #header }
PRMicrodownCanvas >> duringHeaderLevel: anInteger do: aBlockClosure [ 

	self
		raw: (parserClass headerMarkup repeat: anInteger);
		raw: String space.
	aBlockClosure value
]

{ #category : #grammar }
PRMicrodownCanvas >> externalLink: aURL withDescription: aDescription [
	self 
		writeText: aDescription 
		surroundBy: parserClass linkNameOpenerMarkup 
		and: parserClass linkNameCloserMarkup.
	self 
		writeText: aURL 
		surroundBy: parserClass urlOpenerMarkup 
		and: parserClass urlCloserMarkup
]

{ #category : #grammar }
PRMicrodownCanvas >> figure: aFigureUrl withDescription: aDescription [

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
PRMicrodownCanvas >> header: aText withLevel: anInteger [
	self writeText: aText beginsWith: (parserClass headerMarkup repeat: anInteger)
]

{ #category : #initialization }
PRMicrodownCanvas >> initialize [
	super initialize.
	parserClass := MicroDownParser.
	prefixStack := OrderedCollection new.
	lastIsNewLine := true
]

{ #category : #formatting }
PRMicrodownCanvas >> italic: aText [
	self writeText: aText surroundBy: parserClass italicMarkup
]

{ #category : #formatting }
PRMicrodownCanvas >> italicish: aString [
	"Return a text decorated as bold. 
	Does not change the receiver."
	^ parserClass italicMarkup , aString, parserClass italicMarkup
]

{ #category : #accessing }
PRMicrodownCanvas >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #formatting }
PRMicrodownCanvas >> monospace: aText [
	self writeText: aText surroundBy: parserClass monospaceMarkup
]

{ #category : #formatting }
PRMicrodownCanvas >> monospacish: aString [
	"Return a text decorated as bold. 
	Does not change the receiver."
	^ parserClass monospaceMarkup, aString, parserClass monospaceMarkup
]

{ #category : #'writing text' }
PRMicrodownCanvas >> newLine [
	super newLine.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRMicrodownCanvas >> nextPut: aCharacter [
	super nextPut: aCharacter.
	lastIsNewLine := false
]

{ #category : #'prefix-stack' }
PRMicrodownCanvas >> popPrefix [
	
	prefixStack removeLast
]

{ #category : #'writing text' }
PRMicrodownCanvas >> potentialNewLine [
	lastIsNewLine ifFalse: [ self newLine ]
]

{ #category : #grammar }
PRMicrodownCanvas >> preformatted: aText [
	^ self writeText: aText beginsWith: parserClass preformattedMarkup
]

{ #category : #'prefix-stack' }
PRMicrodownCanvas >> pushPrefix: aString [ 
	
	prefixStack addLast: aString
]

{ #category : #'writing text' }
PRMicrodownCanvas >> raw: aString [
	
	lastIsNewLine ifTrue: [ 
		prefixStack do: [ :each |
			super raw: each ].
	].
	super raw: aString.
	lastIsNewLine := false
]

{ #category : #formatting }
PRMicrodownCanvas >> strike: aText [
	self writeText: aText surroundBy: parserClass strikeMarkup
]

{ #category : #formatting }
PRMicrodownCanvas >> strikish: aString [
	"Return a text decorated as bold. 
	Does not change the receiver."
	^ parserClass strikeMarkup, aString, parserClass strikeMarkup
]

{ #category : #writing }
PRMicrodownCanvas >> writeBlockQuoteDuring: aBlockClosure [ 
	
	self
		writePrefix: (parserClass annotatedParagraphMarkup), String space 
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMicrodownCanvas >> writeIndentedCodeBlockDuring: aBlockClosure [ 
	
	self
		writePrefix: parserClass preformattedMarkup
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMicrodownCanvas >> writeLinkDuring: aBlockClosure destination: aString [ 
	
	self
		writeLinkDuring: aBlockClosure
		destination: aString
		title: nil
]

{ #category : #writing }
PRMicrodownCanvas >> writeLinkDuring: aBlockClosure destination: aDestination title: aTitle [ 

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
PRMicrodownCanvas >> writePrefix: aString forEachLineDuring: aBlockClosure [ 

	self pushPrefix: aString.
	aBlockClosure ensure: [ self popPrefix ].
]

{ #category : #writing }
PRMicrodownCanvas >> writeText: aText beginsWith: aMarkup [
	self
		raw: aMarkup;
		raw: String space;
		raw: aText
]

{ #category : #writing }
PRMicrodownCanvas >> writeText: aText surroundBy: aMarkup [
	self writeText: aText surroundBy: aMarkup and: aMarkup
]

{ #category : #writing }
PRMicrodownCanvas >> writeText: aText surroundBy: anOpenerMarkup and: aCloserMarkup [
	self
		raw: anOpenerMarkup;
		raw: aText;
		raw: aCloserMarkup
]
