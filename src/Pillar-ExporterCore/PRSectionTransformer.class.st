"
For each header, I add a section structure. This is useful in export formats (such as HTML5 and Docbook) where sub-sections are embedded in their parent section.
"
Class {
	#name : #PRSectionTransformer,
	#superclass : #PRDocumentChildrenTransformer,
	#instVars : [
		'sections'
	],
	#classVars : [
		'MaxDepthLevel'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'class initialization' }
PRSectionTransformer class >> initialize [
 	" self initialize "
	MaxDepthLevel := self maxDepthLevelForSection
]

{ #category : #accessing }
PRSectionTransformer class >> maxDepthLevel: anObject [
	MaxDepthLevel := anObject
]

{ #category : #protected }
PRSectionTransformer class >> maxDepthLevelForSection [
	^ 7
]

{ #category : #testing }
PRSectionTransformer >> aSectionIsOpen [
	sections do: [ :e | e ifNotNil: [ ^ true ] ].
	^ false
]

{ #category : #private }
PRSectionTransformer >> cleanSections [
	self cleanSectionsUnderLevel: 1
]

{ #category : #private }
PRSectionTransformer >> cleanSectionsAndOpenNewWith: documentItem [
	| newSection |
	documentItem level <= MaxDepthLevel
		ifTrue: [ self cleanSectionsUnderLevel: documentItem level.
			newSection := PRSection with: documentItem.
			sections at: documentItem level put: newSection ]
		ifFalse: [ self currentSection add: documentItem ].
	^ newSection
]

{ #category : #private }
PRSectionTransformer >> cleanSectionsUnderLevel: aNumber [
	[ self currentSectionIndex >= aNumber ] whileTrue: [ self closeLastSection ]
]

{ #category : #private }
PRSectionTransformer >> closeLastSection [
	| lastSection |
	lastSection := self currentSection.
	sections at: self currentSectionIndex put: nil.
	self aSectionIsOpen
		ifTrue: [ self currentSection add: lastSection ]
		ifFalse: [ newChildren add: lastSection ]
]

{ #category : #accessing }
PRSectionTransformer >> currentSection [
	^ sections at: self currentSectionIndex
]

{ #category : #accessing }
PRSectionTransformer >> currentSectionIndex [
	"I return the index of deeper section open now. If I don't have any section open I return -1."

	| index |
	index := MaxDepthLevel.
	sections reverse
		do: [ :each | 
			each ifNotNil: [ ^ index ].
			index := index - 1 ].
	^ -1
]

{ #category : #initialization }
PRSectionTransformer >> initialize [
	super initialize.
	sections := Array ofSize: MaxDepthLevel
]

{ #category : #private }
PRSectionTransformer >> manageItem: documentItem [
	^ documentItem isHeader
		ifTrue: [ self cleanSectionsAndOpenNewWith: documentItem ]
		ifFalse: [ 
			self aSectionIsOpen
				ifTrue: [ self currentSection add: documentItem ]
				ifFalse: [ newChildren add: documentItem ] ]
]

{ #category : #private }
PRSectionTransformer >> possibleTransformationEnding [
	self cleanSections
]
