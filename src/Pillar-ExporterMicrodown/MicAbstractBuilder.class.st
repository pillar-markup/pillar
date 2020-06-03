Class {
	#name : #MicAbstractBuilder,
	#superclass : #PRBasicObject,
	#instVars : [
		'stream',
		'currentBrush'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'instance creation' }
MicAbstractBuilder class >> on: aStream [ 
	^ self new
		setStream: aStream;
		yourself
]

{ #category : #private }
MicAbstractBuilder >> brush: aBrush [
	self flush.
	currentBrush := aBrush.
	aBrush setStream: stream.
	^ aBrush
]

{ #category : #accessing }
MicAbstractBuilder >> flush [
	stream flush
]

{ #category : #'writing text' }
MicAbstractBuilder >> line: aString [
	self
		nextPutAll: aString;
		newLine
]

{ #category : #'writing text' }
MicAbstractBuilder >> lines: aString [
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
MicAbstractBuilder >> newLine [
	stream newLine
]

{ #category : #'writing text' }
MicAbstractBuilder >> nextPut: aCharacter [
	stream nextPut: aCharacter
]

{ #category : #'writing text' }
MicAbstractBuilder >> nextPutAll: aString [
	aString do: [ :char | self nextPut: char ]
]

{ #category : #'writing text' }
MicAbstractBuilder >> nextPutAllLines: aString [
	self withLinesIn: aString do: [ :line | self nextPutAll: line ] separatedBy: [ self newLine ]
]

{ #category : #'writing text' }
MicAbstractBuilder >> raw: aString [
	stream << aString
]

{ #category : #'writing text' }
MicAbstractBuilder >> rawLines: aString [
	"Output aString and take care of line ending within aString."
	self withLinesIn: aString do: [ :line | self raw: line ] separatedBy: [ self newLine ]
]

{ #category : #initialization }
MicAbstractBuilder >> setStream: aStream [ 
	stream := aStream
]

{ #category : #'writing text' }
MicAbstractBuilder >> space [
	stream space
]

{ #category : #private }
MicAbstractBuilder >> withLinesIn: aString do: aBlock separatedBy: anotherBlock [
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
