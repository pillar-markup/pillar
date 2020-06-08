Class {
	#name : #PRAbstractMicrodownBuilderCanvas,
	#superclass : #PRBasicObject,
	#instVars : [
		'stream',
		'currentBrush'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'instance creation' }
PRAbstractMicrodownBuilderCanvas class >> on: aStream [ 
	^ self new
		setStream: aStream;
		yourself
]

{ #category : #private }
PRAbstractMicrodownBuilderCanvas >> brush: aBrush [
	self flush.
	currentBrush := aBrush.
	aBrush setStream: stream.
	^ aBrush
]

{ #category : #accessing }
PRAbstractMicrodownBuilderCanvas >> flush [
	stream flush
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> line: aString [
	self
		nextPutAll: aString;
		newLine
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> lines: aString [
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
PRAbstractMicrodownBuilderCanvas >> newLine [
	stream newLine
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> nextPut: aCharacter [
	stream nextPut: aCharacter
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> nextPutAll: aString [
	aString do: [ :char | self nextPut: char ]
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> nextPutAllLines: aString [
	self withLinesIn: aString do: [ :line | self nextPutAll: line ] separatedBy: [ self newLine ]
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> raw: aString [
	stream << aString
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> rawLines: aString [
	"Output aString and take care of line ending within aString."
	self withLinesIn: aString do: [ :line | self raw: line ] separatedBy: [ self newLine ]
]

{ #category : #initialization }
PRAbstractMicrodownBuilderCanvas >> setStream: aStream [ 
	stream := aStream
]

{ #category : #'writing text' }
PRAbstractMicrodownBuilderCanvas >> space [
	stream space
]

{ #category : #private }
PRAbstractMicrodownBuilderCanvas >> withLinesIn: aString do: aBlock separatedBy: anotherBlock [
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
