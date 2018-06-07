"
A Markdown canvas that facilitates writing Markdown to a stream. It essentially use to nesting the lists
"
Class {
	#name : #PRMarkdownCanvas,
	#superclass : #PRExportCanvas,
	#instVars : [
		'lastIsNewLine',
		'prefixStack'
	],
	#category : 'Pillar-ExporterMarkdown'
}

{ #category : #accessing }
PRMarkdownCanvas >> bold: aText [

	^ self
		raw: '**';
		raw: aText;
		raw: '**'
]

{ #category : #initialization }
PRMarkdownCanvas >> initialize [
	super initialize.
	prefixStack := OrderedCollection new.
	lastIsNewLine := true
]

{ #category : #accessing }
PRMarkdownCanvas >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #'writing text' }
PRMarkdownCanvas >> newLine [
	super newLine.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRMarkdownCanvas >> nextPut: aCharacter [
	super nextPut: aCharacter.
	lastIsNewLine := false
]

{ #category : #'prefix-stack' }
PRMarkdownCanvas >> popPrefix [
	
	prefixStack removeLast
]

{ #category : #'writing text' }
PRMarkdownCanvas >> potentialNewLine [
	lastIsNewLine ifFalse: [ self newLine ]
]

{ #category : #'prefix-stack' }
PRMarkdownCanvas >> pushPrefix: aString [ 
	
	prefixStack addLast: aString
]

{ #category : #'writing text' }
PRMarkdownCanvas >> raw: aString [
	
	lastIsNewLine ifTrue: [ 
		prefixStack do: [ :each |
			super raw: each ].
	].
	super raw: aString.
	lastIsNewLine := false
]

{ #category : #writing }
PRMarkdownCanvas >> writeBlockQuoteDuring: aBlockClosure [ 
	
	self
		writePrefix: '> '
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMarkdownCanvas >> writeIndentedCodeBlockDuring: aBlockClosure [ 
	
	self
		writePrefix: '    '
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMarkdownCanvas >> writeLinkDuring: aBlockClosure destination: aString [ 
	
	self
		writeLinkDuring: aBlockClosure
		destination: aString
		title: nil
]

{ #category : #writing }
PRMarkdownCanvas >> writeLinkDuring: aBlockClosure destination: aDestination title: aTitle [ 

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
PRMarkdownCanvas >> writePrefix: aString forEachLineDuring: aBlockClosure [ 

	self pushPrefix: aString.
	aBlockClosure ensure: [ self popPrefix ].
]
