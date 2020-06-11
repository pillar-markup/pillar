"
I am the place where the visitors will write stuff. I output everything to a stream. Eventhough I have some streaming capabilities (#nextPutAll:, #raw:, ...), my clients should use brushes as much as possible instead. This is because the brushes will take the responsibility to write correct text for the clients.
"
Class {
	#name : #PRExportCanvas,
	#superclass : #PRBasicObject,
	#instVars : [
		'stream',
		'currentBrush'
	],
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #'instance creation' }
PRExportCanvas class >> on: aStream [ 
	^ self new
		setStream: aStream;
		yourself
]

{ #category : #private }
PRExportCanvas >> brush: aBrush [
	self flush.
	currentBrush := aBrush.
	aBrush setStream: stream.
	^ aBrush
]

{ #category : #accessing }
PRExportCanvas >> flush [
	stream flush
]

{ #category : #'writing text' }
PRExportCanvas >> line: aString [
	self
		nextPutAll: aString;
		newLine
]

{ #category : #'writing text' }
PRExportCanvas >> lines: aString [
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
PRExportCanvas >> newLine [
	stream newLine
]

{ #category : #'writing text' }
PRExportCanvas >> nextPut: aCharacter [
	stream nextPut: aCharacter
]

{ #category : #'writing text' }
PRExportCanvas >> nextPutAll: aString [
	aString do: [ :char | self nextPut: char ]
]

{ #category : #'writing text' }
PRExportCanvas >> nextPutAllLines: aString [
	self withLinesIn: aString do: [ :line | self nextPutAll: line ] separatedBy: [ self newLine ]
]

{ #category : #'writing text' }
PRExportCanvas >> raw: aString [
	stream << aString
]

{ #category : #'writing text' }
PRExportCanvas >> rawLines: aString [
	"Output aString and take care of line ending within aString."
	self withLinesIn: aString do: [ :line | self raw: line ] separatedBy: [ self newLine ]
]

{ #category : #initialization }
PRExportCanvas >> setStream: aStream [ 
	stream := aStream
]

{ #category : #'writing text' }
PRExportCanvas >> space [
	stream space
]

{ #category : #private }
PRExportCanvas >> withLinesIn: aString do: aBlock separatedBy: anotherBlock [
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
