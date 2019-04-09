Class {
	#name : #PREnvironmentTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'currentColumn',
		'goal',
		'currentEnvironment'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'meta-data' }
PREnvironmentTransformer class >> dependencies [
	^ { PRCleanAnnotationInParagraphTransformer }
]

{ #category : #protected }
PREnvironmentTransformer >> add: anObject toCurrentEnvironmentOr: aBlock [
	currentColumn isNil & currentEnvironment isNil
		ifTrue: [ ^ aBlock value ].
	self delete.
	currentColumn
		ifNotNil: [ currentColumn add: anObject ]
		ifNil: [ currentEnvironment add: anObject ]
]

{ #category : #accessing }
PREnvironmentTransformer >> goal: aPRBuildGoal [ 
	
	goal := aPRBuildGoal
]

{ #category : #plugin }
PREnvironmentTransformer >> prepareForExecutionOn: aPRProject [ 
	"None"
]

{ #category : #visiting }
PREnvironmentTransformer >> start: aDocumentItem [
	| object |
	
	"Execute clean annotation before"
	object := super start: (PRCleanAnnotationInParagraphTransformer new start: aDocumentItem).
	currentEnvironment notNil | currentColumn notNil
		ifTrue: [ PRError
				signal:
					'Missing ending columns annotation. Please use ${endColumns}$ at the end of the columns environment.' ].
	^ object
]

{ #category : #'visiting-annotations' }
PREnvironmentTransformer >> visitBeginEnvironmentAnnotation: anAnnotation [
	self halt.
	currentEnvironment notNil
		ifTrue: [ PRError
				signal:
					'You have to close a columns environment before you open an other. Use the ${endColumns}$ tag please.' ].
	currentEnvironment := PREnvironment named: (anAnnotation parameters at: 'name' ifAbsent: [ PREnvironmentMissedNamed signal ]).
	self delete
]

{ #category : #'visiting-annotations' }
PREnvironmentTransformer >> visitColumnAnnotation: anAnnotation [
	currentEnvironment isNil
		ifTrue: [ PRError
				signal:
					'You can''t create a new column if you are not inside a column environment. Please use ${columns}$ before the beginning of a column.' ].
	currentColumn := PRColumn width: (anAnnotation parameters at: 'width').
	currentEnvironment add: currentColumn.
	self delete
]

{ #category : #'visiting-annotations' }
PREnvironmentTransformer >> visitColumnsAnnotation: anAnnotation [
	currentEnvironment notNil
		ifTrue: [ PRError
				signal:
					'You have to close a columns environment before you open an other. Use the ${endColumns}$ tag please.' ].
	currentEnvironment := PRColumnEnvironment new.
	self delete
]

{ #category : #'visiting-annotations' }
PREnvironmentTransformer >> visitDocumentGroup: aGroup [
	self add: aGroup toCurrentEnvironmentOr: [ super visitDocumentGroup: aGroup ]
]

{ #category : #'visiting-annotations' }
PREnvironmentTransformer >> visitDocumentItem: anItem [
	self add: anItem toCurrentEnvironmentOr: [ super visitDocumentItem: anItem ]
]

{ #category : #'visiting-annotations' }
PREnvironmentTransformer >> visitEndEnvironmentAnnotation: anAnnotation [
	currentEnvironment isNil
		ifTrue: [ PRError signal: 'Column environement ending encounter out of a column environment.' ].
	self replace: {currentEnvironment}.
	currentEnvironment := nil.
	currentColumn := nil
]
