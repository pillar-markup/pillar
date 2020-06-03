Class {
	#name : #PRMicrodownBuilderCanvas,
	#superclass : #PRExportCanvas,
	#instVars : [
		'lastIsNewLine',
		'prefixStack'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
PRMicrodownBuilderCanvas >> bold: aText [

	^ self
		raw: '**';
		raw: aText;
		raw: '**'
]

{ #category : #initialization }
PRMicrodownBuilderCanvas >> initialize [
	super initialize.
	prefixStack := OrderedCollection new.
	lastIsNewLine := true
]

{ #category : #accessing }
PRMicrodownBuilderCanvas >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #'writing text' }
PRMicrodownBuilderCanvas >> newLine [
	super newLine.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRMicrodownBuilderCanvas >> nextPut: aCharacter [
	super nextPut: aCharacter.
	lastIsNewLine := false
]

{ #category : #'prefix-stack' }
PRMicrodownBuilderCanvas >> popPrefix [
	
	prefixStack removeLast
]

{ #category : #'writing text' }
PRMicrodownBuilderCanvas >> potentialNewLine [
	lastIsNewLine ifFalse: [ self newLine ]
]

{ #category : #'prefix-stack' }
PRMicrodownBuilderCanvas >> pushPrefix: aString [ 
	
	prefixStack addLast: aString
]

{ #category : #'writing text' }
PRMicrodownBuilderCanvas >> raw: aString [
	
	lastIsNewLine ifTrue: [ 
		prefixStack do: [ :each |
			super raw: each ].
	].
	super raw: aString.
	lastIsNewLine := false
]

{ #category : #writing }
PRMicrodownBuilderCanvas >> writeBlockQuoteDuring: aBlockClosure [ 
	
	self
		writePrefix: '> '
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMicrodownBuilderCanvas >> writeIndentedCodeBlockDuring: aBlockClosure [ 
	
	self
		writePrefix: '    '
		forEachLineDuring: aBlockClosure.
]

{ #category : #writing }
PRMicrodownBuilderCanvas >> writeLinkDuring: aBlockClosure destination: aString [ 
	
	self
		writeLinkDuring: aBlockClosure
		destination: aString
		title: nil
]

{ #category : #writing }
PRMicrodownBuilderCanvas >> writeLinkDuring: aBlockClosure destination: aDestination title: aTitle [ 

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
PRMicrodownBuilderCanvas >> writePrefix: aString forEachLineDuring: aBlockClosure [ 

	self pushPrefix: aString.
	aBlockClosure ensure: [ self popPrefix ].
]
