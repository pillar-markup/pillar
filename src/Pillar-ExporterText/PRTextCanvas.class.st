"
A canvas for writing text
"
Class {
	#name : #PRTextCanvas,
	#superclass : #PRExportCanvas,
	#instVars : [
		'lastIsNewLine'
	],
	#category : 'Pillar-ExporterText'
}

{ #category : #initialization }
PRTextCanvas >> initialize [
	super initialize.
	lastIsNewLine := true
]

{ #category : #testing }
PRTextCanvas >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #'writing text' }
PRTextCanvas >> newLine [
	super newLine.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRTextCanvas >> nextPut: aCharacter [
	super nextPut: aCharacter.
	lastIsNewLine := false
]

{ #category : #'writing text' }
PRTextCanvas >> potentialNewLine [
	lastIsNewLine
		ifFalse: [ self newLine ]
]

{ #category : #'writing text' }
PRTextCanvas >> raw: aString [
	super raw: aString.
	lastIsNewLine := false.
]

{ #category : #writing }
PRTextCanvas >> tab [
	self nextPut: Character tab
]
