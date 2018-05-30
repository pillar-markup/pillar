"
An AsciiDoc canvas that facilitates writing AsciiDoc to a stream. The main methods are #surround:with: and #precede:by: that allow you to write something like this:

canvas surround:  [ ""some code that generates the string inside the bold"" ] with: '*'

canvas precede: [ ""some code that generates the string which will be change by the label"" ]  by: '[label]' 
"
Class {
	#name : #PRAsciiDocCanvas,
	#superclass : #PRExportCanvas,
	#instVars : [
		'lastIsNewLine'
	],
	#category : 'Pillar-ExporterAsciiDoc'
}

{ #category : #initialization }
PRAsciiDocCanvas >> initialize [
	super initialize.
	lastIsNewLine := true
]

{ #category : #accessing }
PRAsciiDocCanvas >> lastIsNewLine [
	^lastIsNewLine
]

{ #category : #'writing text' }
PRAsciiDocCanvas >> newLine [
	super newLine.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRAsciiDocCanvas >> nextPut: aCharacter [
	super nextPut: aCharacter.
	lastIsNewLine := false
]

{ #category : #'writing text' }
PRAsciiDocCanvas >> potentialNewLine [
	lastIsNewLine 
		ifFalse: [ self newLine ]
]

{ #category : #'writing text' }
PRAsciiDocCanvas >> precede: aStringOrABlock by: anotherString [

	stream << anotherString << aStringOrABlock 
]

{ #category : #'writing text' }
PRAsciiDocCanvas >> raw: aString [
	super raw: aString.
	lastIsNewLine := false
]

{ #category : #'writing text' }
PRAsciiDocCanvas >> surround: aStringOrBlock with: anotherString [
	self surround: aStringOrBlock with: anotherString and: anotherString 
]

{ #category : #'writing text' }
PRAsciiDocCanvas >> surround: aStringOrBlock with: anotherString and: theLastString [
	stream << anotherString << aStringOrBlock << theLastString
]

{ #category : #'stop conditions' }
PRAsciiDocCanvas >> tab [
	self nextPut: Character tab
]
