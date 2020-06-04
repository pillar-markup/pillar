Class {
	#name : #PRMicrodownCanvas,
	#superclass : #PRBuilderCanvas,
	#instVars : [
		'lastIsNewLine',
		'prefixStack',
		'parserClass'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'grammar features' }
PRMicrodownCanvas >> bold: aText [
	^ self surround: aText withMarkup: (parserClass inlineMarkup: #bold)
]

{ #category : #'grammar features' }
PRMicrodownCanvas >> header: aText [
	"http://spec.commonmark.org/0.28/#atx-headings"
	stream
		nextPutAll: parserClass headerMarkup ; 
		nextPut: Character space;
		nextPutAll: aText;
		crlf
]

{ #category : #initialization }
PRMicrodownCanvas >> initialize [
	super initialize.
	prefixStack := OrderedCollection new.
	parserClass := MicroDownParser.
	lastIsNewLine := true
]

{ #category : #'grammar features' }
PRMicrodownCanvas >> italic: aText [
	^ self surround: aText withMarkup: (parserClass inlineMarkup: #italic)
]

{ #category : #accessing }
PRMicrodownCanvas >> lastIsNewLine [
	^ lastIsNewLine
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

{ #category : #format }
PRMicrodownCanvas >> surround: aText withMarkup: aMarkup [
	^ self
		raw: aMarkup;
		raw: aText;
		raw: aMarkup
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
