Class {
	#name : #PRBuilderCanvas,
	#superclass : #PRBasicObject,
	#instVars : [
		'stream',
		'currentBrush'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #'instance creation' }
PRBuilderCanvas class >> on: aStream [ 
	^ self new
		setStream: aStream;
		yourself
]

{ #category : #private }
PRBuilderCanvas >> brush: aBrush [
	self flush.
	currentBrush := aBrush.
	aBrush setStream: stream.
	^ aBrush
]

{ #category : #accessing }
PRBuilderCanvas >> contents [
	^ stream contents
]

{ #category : #accessing }
PRBuilderCanvas >> flush [
	stream flush
]

{ #category : #'writing text' }
PRBuilderCanvas >> line: aString [
	self
		nextPutAll: aString;
		newLine
]

{ #category : #'writing text' }
PRBuilderCanvas >> lines: aString [
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
PRBuilderCanvas >> newLine [
	stream newLine
]

{ #category : #'writing text' }
PRBuilderCanvas >> nextPut: aCharacter [
	stream nextPut: aCharacter
]

{ #category : #'writing text' }
PRBuilderCanvas >> nextPutAll: aString [
	aString do: [ :char | self nextPut: char ]
]

{ #category : #'writing text' }
PRBuilderCanvas >> nextPutAllLines: aString [
	self withLinesIn: aString do: [ :line | self nextPutAll: line ] separatedBy: [ self newLine ]
]

{ #category : #'writing text' }
PRBuilderCanvas >> raw: aString [
	stream << aString
]

{ #category : #'writing text' }
PRBuilderCanvas >> rawLines: aString [
	"Output aString and take care of line ending within aString."
	self withLinesIn: aString do: [ :line | self raw: line ] separatedBy: [ self newLine ]
]

{ #category : #initialization }
PRBuilderCanvas >> setStream: aStream [ 
	stream := aStream
]

{ #category : #'writing text' }
PRBuilderCanvas >> space [
	stream space
]

{ #category : #private }
PRBuilderCanvas >> withLinesIn: aString do: aBlock separatedBy: anotherBlock [
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
