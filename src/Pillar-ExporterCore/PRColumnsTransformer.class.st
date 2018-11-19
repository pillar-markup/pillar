"
I replace each ==columns== annotation with a structure of columns.
"
Class {
	#name : #PRColumnsTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'currentColumns',
		'currentColumn',
		'goal'
	],
	#category : 'Pillar-ExporterCore-Export'
}

{ #category : #'meta-data' }
PRColumnsTransformer class >> dependencies [
	^ { PRCleanAnnotationInParagraphTransformer }
]

{ #category : #protected }
PRColumnsTransformer >> add: anObject toCurrentEnvironmentOr: aBlock [
	currentColumn isNil & currentColumns isNil
		ifTrue: [ ^ aBlock value ].
	self delete.
	currentColumn
		ifNotNil: [ currentColumn add: anObject ]
		ifNil: [ currentColumns add: anObject ]
]

{ #category : #accessing }
PRColumnsTransformer >> goal: aPRBuildGoal [ 
	
	goal := aPRBuildGoal
]

{ #category : #plugin }
PRColumnsTransformer >> prepareForExecutionOn: aPRProject [ 
	
	"None"
]

{ #category : #visiting }
PRColumnsTransformer >> start: aDocumentItem [
	| object |
	
	"Execute clean annotation before"
	object := super start: (PRCleanAnnotationInParagraphTransformer new start: aDocumentItem).
	currentColumns notNil | currentColumn notNil
		ifTrue: [ PRError
				signal:
					'Missing ending columns annotation. Please use ${endColumns}$ at the end of the columns environment.' ].
	^ object
]

{ #category : #'visiting-annotations' }
PRColumnsTransformer >> visitColumnAnnotation: anAnnotation [
	currentColumns isNil
		ifTrue: [ PRError
				signal:
					'You can''t create a new column if you are not inside a column environment. Please use ${columns}$ before the beginning of a column.' ].
	currentColumn := PRColumn width: (anAnnotation parameters at: 'width').
	currentColumns add: currentColumn.
	self delete
]

{ #category : #'visiting-annotations' }
PRColumnsTransformer >> visitColumnsAnnotation: anAnnotation [
	currentColumns notNil
		ifTrue: [ PRError
				signal:
					'You have to close a columns environment before you open an other. Use the ${endColumns}$ tag please.' ].
	currentColumns := PRColumns new.
	self delete
]

{ #category : #'visiting-annotations' }
PRColumnsTransformer >> visitDocumentGroup: aGroup [
	self add: aGroup toCurrentEnvironmentOr: [ super visitDocumentGroup: aGroup ]
]

{ #category : #'visiting-annotations' }
PRColumnsTransformer >> visitDocumentItem: anItem [
	self add: anItem toCurrentEnvironmentOr: [ super visitDocumentItem: anItem ]
]

{ #category : #'visiting-annotations' }
PRColumnsTransformer >> visitEndColumnsAnnotation: anAnnotation [
	currentColumns isNil
		ifTrue: [ PRError signal: 'Column environement ending encounter out of a column environment.' ].
	self replace: {currentColumns}.
	currentColumns := nil.
	currentColumn := nil
]
