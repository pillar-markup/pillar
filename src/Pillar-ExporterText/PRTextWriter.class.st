"
A writer for text
 
"
Class {
	#name : #PRTextWriter,
	#superclass : #PRDocumentWriter,
	#instVars : [
		'nesting'
	],
	#category : 'Pillar-ExporterText'
}

{ #category : #accessing }
PRTextWriter class >> fileExtension [
	^ 'txt'
]

{ #category : #accessing }
PRTextWriter class >> folderName [
	^ #text
]

{ #category : #accessing }
PRTextWriter class >> writerName [
	^ #text
]

{ #category : #accessing }
PRTextWriter >> canvasClass [
	^ PRTextCanvas
]

{ #category : #private }
PRTextWriter >> nest: aString do: aBlock [
	nesting add: aString.
	aBlock ensure: [ nesting removeLast ]
]

{ #category : #visiting }
PRTextWriter >> start: anObject [
	nesting := OrderedCollection new.
	super start: anObject.
	canvas lastIsNewLine
		ifTrue: [ stream trimLastNewLine ]

]

{ #category : #'visiting-document' }
PRTextWriter >> visitDataItem: anObject [
	self nest: ' ' do: [ super visitDataItem: anObject ]
]

{ #category : #'visiting-document' }
PRTextWriter >> visitDefinitionList: anObject [
	canvas potentialNewLine.
	self visitAll: anObject children
]

{ #category : #'visiting-document' }
PRTextWriter >> visitHeader: anObject [
	super visitHeader: anObject.
	canvas newLine
]

{ #category : #'visiting-document' }
PRTextWriter >> visitHorizontalRule: anObject [
	canvas
		nextPutAll: ((String new: 40) atAllPut: $-);
		newLine
]

{ #category : #'visiting-document' }
PRTextWriter >> visitListItem: anObject [ 
	nesting last isInteger ifTrue: [ nesting addLast: nesting removeLast + 1 ].
	nesting size - 1 timesRepeat: [ canvas tab ].
	canvas nextPutAll: nesting last asString.
	canvas nextPutAll: (nesting last isInteger 
			ifTrue: [ '. ' ]
			ifFalse: [ ' ' ]).
	super visitListItem: anObject.
	canvas potentialNewLine
]

{ #category : #'visiting-document' }
PRTextWriter >> visitOrderedList: anObject [
	canvas potentialNewLine.
	self nest: 0 do: [ super visitOrderedList: anObject ]
]

{ #category : #'visiting-document' }
PRTextWriter >> visitParagraph: anObject [
	super visitParagraph: anObject.
	canvas newLine
]

{ #category : #'visiting-document' }
PRTextWriter >> visitPreformatted: anObject [
	anObject children do: [ :each | self visit: each. canvas newLine ]
]

{ #category : #'visiting-document' }
PRTextWriter >> visitRaw: anObject [
	(anObject type isNil or: [ anObject type = 'text' ])
		ifTrue: [ canvas nextPutAll: anObject text ]
]

{ #category : #'visiting-document' }
PRTextWriter >> visitReference: anObject [
	anObject hasAlias
		ifTrue: [ super visitReference: anObject ]
		ifFalse: [ canvas nextPutAll: anObject title ]
]

{ #category : #'visiting-document' }
PRTextWriter >> visitTableRow: anObject [
	anObject children
		do: [ :each | self visit: each ]
		separatedBy: [ canvas tab ].
	canvas newLine
]

{ #category : #'visiting-document' }
PRTextWriter >> visitTermItem: anObject [
	self nest: '-' do: [ super visitDataItem: anObject ]
]

{ #category : #'visiting-document' }
PRTextWriter >> visitText: anObject [
	canvas nextPutAll: anObject text
]

{ #category : #'visiting-document' }
PRTextWriter >> visitUnorderedList: anObject [
	canvas potentialNewLine.
	self nest: '*' do: [ super visitUnorderedList: anObject ]
]
