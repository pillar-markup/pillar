"
I encapsulate microdown writing logic. 


## Implementation points
I'm a subclass from a class that is not shared by other PR elements because I will be moved to the microdown package.
"
Class {
	#name : #PRMicrodownCanvas,
	#superclass : #PRAbstractMicrodownBuilderCanvas,
	#instVars : [
		'lastIsNewLine',
		'prefixStack',
		'parserClass'
	],
	#category : #'Pillar-ExporterMicrodown-Core'
}

{ #category : #formatting }
PRMicrodownCanvas >> bold: aText [
	"Return a text decorated as bold. 
	Does not change the receiver."
	^ self writeText: aText surroundBy: parserClass boldMarkup
]

{ #category : #accessing }
PRMicrodownCanvas >> comment: aTextLine [
	^ self writeText: aTextLine beginsWith: (parserClass commentedLineMarkup), String space
]

{ #category : #accessing }
PRMicrodownCanvas >> contents [
	^ stream contents
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

{ #category : #grammar }
PRMicrodownCanvas >> header: aText withLevel: anInteger [
	^ self writeText: aText beginsWith: (parserClass headerMarkup repeat: anInteger), String space.
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
	^ self writeText: aText surroundBy: parserClass italicMarkup
]

{ #category : #accessing }
PRMicrodownCanvas >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #formatting }
PRMicrodownCanvas >> monospace: aText [
	^ self writeText: aText surroundBy: parserClass monospaceMarkup
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
	^ self writeText: aText surroundBy: parserClass strikeMarkup
]

{ #category : #writing }
PRMicrodownCanvas >> writeBlockQuoteDuring: aBlockClosure [ 
	
	self
		writePrefix: '> '
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMicrodownCanvas >> writeIndentedCodeBlockDuring: aBlockClosure [ 
	
	self
		writePrefix: '    '
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
	^ self
		raw: aMarkup;
		raw: aText
]

{ #category : #writing }
PRMicrodownCanvas >> writeText: aText surroundBy: aMarkup [
	^ self writeText: aText surroundBy: aMarkup and: aMarkup
]

{ #category : #writing }
PRMicrodownCanvas >> writeText: aText surroundBy: anOpenerMarkup and: aCloserMarkup [
	^ self
		raw: anOpenerMarkup;
		raw: aText;
		raw: aCloserMarkup
]
