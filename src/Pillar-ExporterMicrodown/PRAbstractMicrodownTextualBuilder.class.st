"
I'm a copy of Pillar textual canvas. I should be fusioned in my subclass and probably be moved to the microdown project because I'm not linked to Pillar.
"
Class {
	#name : #PRAbstractMicrodownTextualBuilder,
	#superclass : #Object,
	#instVars : [
		'stream',
		'currentBrush'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'instance creation' }
PRAbstractMicrodownTextualBuilder class >> on: aStream [ 
	^ self new
		setStream: aStream;
		yourself
]

{ #category : #private }
PRAbstractMicrodownTextualBuilder >> brush: aBrush [
	self flush.
	currentBrush := aBrush.
	aBrush setStream: stream.
	^ aBrush
]

{ #category : #accessing }
PRAbstractMicrodownTextualBuilder >> flush [
	stream flush
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> line: aString [
	self
		nextPutAll: aString;
		newLine
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> lines: aString [
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

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> newLine [
	self raw: String cr
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> nextPut: aCharacter [
	stream nextPut: aCharacter
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> nextPutAll: aString [
	aString do: [ :char | self nextPut: char ]
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> nextPutAllLines: aString [
	self withLinesIn: aString do: [ :line | self nextPutAll: line ] separatedBy: [ self newLine ]
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> raw: aString [
	stream << aString
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> rawLines: aString [
	"Output aString and take care of line ending within aString."
	self withLinesIn: aString do: [ :line | self raw: line ] separatedBy: [ self newLine ]
]

{ #category : #initialization }
PRAbstractMicrodownTextualBuilder >> setStream: aStream [ 
	stream := aStream
]

{ #category : #'writing text' }
PRAbstractMicrodownTextualBuilder >> space [
	stream space
]

{ #category : #private }
PRAbstractMicrodownTextualBuilder >> withLinesIn: aString do: aBlock separatedBy: anotherBlock [
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
