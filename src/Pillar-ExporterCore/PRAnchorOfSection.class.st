"
After each title I add an anchor with the title of the section.

I'm used with the autoAnchor configuration parameter.
"
Class {
	#name : #PRAnchorOfSection,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'occurenceOfHeader'
	],
	#category : 'Pillar-ExporterCore-Features'
}

{ #category : #accessing }
PRAnchorOfSection class >> charForAnchorOccurence [
	^ '@'
]

{ #category : #adding }
PRAnchorOfSection >> addAnchorOf: aPRHeader [

	| anchorText headerText |
	headerText := aPRHeader headerText.
	
	occurenceOfHeader at: headerText ifAbsentPut: 0.
	occurenceOfHeader at: headerText put: ((occurenceOfHeader at: headerText) + 1).
	
	anchorText := headerText , self class charForAnchorOccurence , (occurenceOfHeader at: headerText) asString .
	^ Array with: aPRHeader with: (PRAnchor named: anchorText)
]

{ #category : #private }
PRAnchorOfSection >> initOccurenceOfAnchor: aGroup [
	occurenceOfHeader := Dictionary new.
	aGroup children
		do: [ :child | 
			child class = PRAnchor
				ifTrue: [ self verifyAnchorName: child name ] ].
]

{ #category : #private }
PRAnchorOfSection >> verifyAnchorName: aString [
	"Verify an anchor name, if it has the form 'anchorName@aNumber', the occurence number on  the dictionary is changed by aNumber if it is greater than the occurence and if anchorName is a key on the dictionary"
	| anchorParts anchorLastPart realAnchorName |
	
	anchorParts := (aString substrings: '@') asOrderedCollection.
	(anchorParts size > 1)  ifFalse: [ ^ self ].
	anchorLastPart := (anchorParts at: (anchorParts size)).
	
	anchorLastPart asNumber isNumber 
		ifTrue: [ anchorParts removeAt: (anchorParts size) ].
	
	realAnchorName := anchorParts inject: '' into: [ :substring :next | substring , next ].
	
	((occurenceOfHeader at: realAnchorName ifAbsent: [ true ]) or: [ (occurenceOfHeader at: realAnchorName) > (anchorLastPart asNumber) ])
		ifTrue: [ occurenceOfHeader at: realAnchorName put: (anchorLastPart asNumber) ].
]

{ #category : #'visiting-document' }
PRAnchorOfSection >> visitDocumentGroup: aGroup [
	occurenceOfHeader ifNil: [ self initOccurenceOfAnchor: aGroup ].
	
	aGroup
		setChildren:
			(aGroup children
				flatCollect: [ :child | 
					"if child is a PRHeader and the configuration's parameter autoAnchor is true"
					((child class = PRHeader) and: [((self configuration printer levelConfigurationFor: child ) autoAnchor ) ])
						ifTrue: [ self addAnchorOf: child ]
						ifFalse: [ 
							replacement push: {child}.
							self visit: child.
							replacement pop ] ])
]
