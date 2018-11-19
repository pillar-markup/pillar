"
A pillar canvas

Instance Variables
	lastIsNewLine:		<Object>

lastIsNewLine
	- xxxxx

"
Class {
	#name : #PRPillarCanvas,
	#superclass : #PRExportCanvas,
	#instVars : [
		'lastIsNewLine'
	],
	#classVars : [
		'PillarCharacters'
	],
	#category : 'Pillar-ExporterPillar'
}

{ #category : #'class initialization' }
PRPillarCanvas class >> initialize [
	" self initialize "

	PillarCharacters := Dictionary new.
	PRPillarGrammar markups
		valuesDo:
			[ :markup | 
			markup
				do:
					[ :char | 
					char = Character space
						ifFalse: [ PillarCharacters at: char put: '\' , char asString ] ] ]
]

{ #category : #initialization }
PRPillarCanvas >> initialize [
	super initialize.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRPillarCanvas >> lastIsNewLine [
	^ lastIsNewLine
]

{ #category : #'writing text' }
PRPillarCanvas >> newLine [
	super newLine.
	lastIsNewLine := true
]

{ #category : #'writing text' }
PRPillarCanvas >> nextPut: aCharacter [
	(PillarCharacters at: aCharacter ifAbsent: nil) 
		ifNil: [ super nextPut: aCharacter ] 
		ifNotNil: [ :string | self raw: string ].
	lastIsNewLine := false
]

{ #category : #'writing text' }
PRPillarCanvas >> potentialNewLine [
	lastIsNewLine
		ifFalse: [ self newLine ]
]

{ #category : #'writing text' }
PRPillarCanvas >> raw: aString [
	super raw: aString.
	lastIsNewLine := false.
]
