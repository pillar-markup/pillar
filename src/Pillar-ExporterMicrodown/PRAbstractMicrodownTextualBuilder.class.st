"
I'm a copy of Pillar textual canvas. I should be fusioned in my subclass and probably be moved to the microdown project because I'm not linked to Pillar.
"
Class {
	#name : #PRAbstractMicrodownTextualBuilder,
	#superclass : #Object,
	#instVars : [
		'stream',
		'parserClass',
		'lastIsNewLine'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'instance creation' }
PRAbstractMicrodownTextualBuilder class >> on: aStream [ 
	^ self new
		setStream: aStream;
		yourself
]

{ #category : #formatting }
PRAbstractMicrodownTextualBuilder >> bold: aText [

	self writeText: aText surroundBy: parserClass boldMarkup
]

{ #category : #initialization }
PRAbstractMicrodownTextualBuilder >> flush [
	stream flush
]

{ #category : #initialization }
PRAbstractMicrodownTextualBuilder >> initialize [
	super initialize.
	parserClass := MicroDownParser.
	lastIsNewLine := true
]

{ #category : #formatting }
PRAbstractMicrodownTextualBuilder >> italic: aText [

	self writeText: aText surroundBy: parserClass italicMarkup
]

{ #category : #testing }
PRAbstractMicrodownTextualBuilder >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> line: aString [
	self
		nextPutAll: aString;
		newLine
]

{ #category : #formatting }
PRAbstractMicrodownTextualBuilder >> monospace: aText [

	self writeText: aText surroundBy: parserClass monospaceMarkup
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> newLine [
	self raw: String cr.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> nextPut: aCharacter [
	stream nextPut: aCharacter.
	lastIsNewLine := false
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> nextPutAll: aString [
	
	aString do: [ :char | self nextPut: char ]
]

{ #category : #'writing low-level' }
PRAbstractMicrodownTextualBuilder >> potentialNewLine [
	lastIsNewLine ifFalse: [ self newLine ]
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> raw: aString [
	stream << aString
]

{ #category : #initialization }
PRAbstractMicrodownTextualBuilder >> setStream: aStream [ 
	stream := aStream
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> space [
	stream space
]

{ #category : #formatting }
PRAbstractMicrodownTextualBuilder >> strike: aText [

	self writeText: aText surroundBy: parserClass strikeMarkup
]

{ #category : #writing }
PRAbstractMicrodownTextualBuilder >> text: aText [
	self raw: aText
	
]

{ #category : #writing }
PRAbstractMicrodownTextualBuilder >> writeLinkDuring: aBlockClosure destination: aString [ 
	
	self
		writeLinkDuring: aBlockClosure
		destination: aString
		title: nil
]

{ #category : #writing }
PRAbstractMicrodownTextualBuilder >> writeLinkDuring: aBlockClosure destination: aDestination title: aTitle [ 

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
PRAbstractMicrodownTextualBuilder >> writeNewLine [
	self raw: String cr
	
]

{ #category : #writing }
PRAbstractMicrodownTextualBuilder >> writeText: aText beginsWith: aMarkup [
	self
		raw: aMarkup;
		raw: String space;
		raw: aText
]

{ #category : #writing }
PRAbstractMicrodownTextualBuilder >> writeText: aText surroundBy: aMarkup [
	self writeText: aText surroundBy: aMarkup and: aMarkup
]

{ #category : #writing }
PRAbstractMicrodownTextualBuilder >> writeText: aText surroundBy: anOpenerMarkup and: aCloserMarkup [
	self
		raw: anOpenerMarkup;
		raw: aText;
		raw: aCloserMarkup
]
