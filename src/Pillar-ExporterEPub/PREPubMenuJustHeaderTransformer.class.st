"
I am a transformer which Just keep headers with the hierarchy. I am useful for EPub Menus.

"
Class {
	#name : #PREPubMenuJustHeaderTransformer,
	#superclass : #PRSectionTransformer,
	#instVars : [
		'currentsArray',
		'maxHeader'
	],
	#category : #'Pillar-ExporterEPub'
}

{ #category : #accessing }
PREPubMenuJustHeaderTransformer class >> key [
	^#justKeepHeaders
]

{ #category : #accessing }
PREPubMenuJustHeaderTransformer class >> writers [
	^ #(#tocmenu #navmenu)
]

{ #category : #actions }
PREPubMenuJustHeaderTransformer >> actionOn: anInput [
	^ (self class writers
		includes: ((anInput configuration propertyAt: #_outputFormat) writerFor: anInput configuration) class writerName)
		ifTrue: [ maxHeader := self maxHeaderOf: anInput input.
			super actionOn: anInput ]
		ifFalse: [ anInput ]
]

{ #category : #private }
PREPubMenuJustHeaderTransformer >> initCurrentsArray [
	currentsArray := #(nil nil nil nil nil nil nil) copy.
]

{ #category : #private }
PREPubMenuJustHeaderTransformer >> manageItem: aDocumentItem [
	| newSection parent |
	^ (aDocumentItem isHeader and: [ aDocumentItem level = maxHeader ])
		ifTrue: [ newSection := self cleanSectionsAndOpenNewWith: aDocumentItem.
			self initCurrentsArray.
			currentsArray at: maxHeader put: newSection ]
		ifFalse: [ aDocumentItem isHeader
				ifTrue: [ parent := self sectionToLinkWith: aDocumentItem.
					newSection := PRSection with: aDocumentItem.
					parent add: newSection.
					currentsArray at: aDocumentItem level put: newSection ]
				ifFalse: [ aDocumentItem isGroup
						ifTrue: [ aDocumentItem children do: [ :each | self manageItem: each ] ] ] ]
]

{ #category : #private }
PREPubMenuJustHeaderTransformer >> maxHeaderOf: anObject [
	^ anObject isHeader
		ifTrue: [ anObject level ]
		ifFalse: [ anObject isGroup
				ifTrue: [ anObject children size > 0
						ifTrue: [ (anObject children
								collect: [ :child | 
									child isHeader
										ifTrue: [ child level ]
										ifFalse: [ 7 ] ]) min ] ]
				ifFalse: [ 7 ] ]
]

{ #category : #private }
PREPubMenuJustHeaderTransformer >> sectionToLinkWith: aHeader [
	| headerLevel |
	headerLevel := aHeader level - 1.
	[ (currentsArray at: headerLevel) isNil ] whileTrue: [ headerLevel := headerLevel - 1 ].
	^ currentsArray at: headerLevel
]
