Class {
	#name : #PRMorphCanvas,
	#superclass : #PRExportCanvas,
	#instVars : [
		'text'
	],
	#category : #'Pillar-MorphicRenderer'
}

{ #category : #initialization }
PRMorphCanvas >> append: aText [
	text append: aText
]

{ #category : #accessing }
PRMorphCanvas >> flush [
]

{ #category : #initialization }
PRMorphCanvas >> initialize [
	super initialize.
	text := Text new
]

{ #category : #initialization }
PRMorphCanvas >> newLine [ 
	text append: String cr
]

{ #category : #'instance creation' }
PRMorphCanvas >> nextPut: aCharacter [
	text append: aCharacter
]

{ #category : #accessing }
PRMorphCanvas >> text [
	^ text
]
