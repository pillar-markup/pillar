Class {
	#name : #PREnvironmentTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'currentColumn',
		'goal',
		'environmentStack'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'meta-data' }
PREnvironmentTransformer class >> dependencies [
	^ { PRCleanAnnotationInParagraphTransformer }
]

{ #category : #protected }
PREnvironmentTransformer >> add: anObject toCurrentEnvironmentOr: aBlock [
	currentColumn isNil & self hasEnvironment not
		ifTrue: [ ^ aBlock value ].
	self delete.
	currentColumn
		ifNotNil: [ currentColumn add: anObject ]
		ifNil: [ self currentEnvironment add: anObject ]
]

{ #category : #environment }
PREnvironmentTransformer >> currentEnvironment [

	^ environmentStack first
]

{ #category : #accessing }
PREnvironmentTransformer >> goal: aPRBuildGoal [ 
	
	goal := aPRBuildGoal
]

{ #category : #environment }
PREnvironmentTransformer >> hasEnvironment [
	^ environmentStack isNotEmpty
]

{ #category : #initialization }
PREnvironmentTransformer >> initialize [

	super initialize.
	environmentStack := OrderedCollection new.
]

{ #category : #environment }
PREnvironmentTransformer >> popEnvironment [

	^ environmentStack removeFirst
]

{ #category : #environment }
PREnvironmentTransformer >> pushEnvironment: anEnvironment [

	"If it is the root environment (i.e., the first environment found in this document's structure)
	we replace the annotation with the environment node.
	
	Otherwise add the environment to the current environment and delete the current node.
	
	This is required because environment annotations are in a flat world and we have to translate that to a nester treeish world"
	self hasEnvironment
		ifFalse: [ self replace: { anEnvironment } ]
		ifTrue: [ 
			self currentEnvironment add: anEnvironment.
			self delete. ].

	environmentStack addFirst: anEnvironment.
]

{ #category : #visiting }
PREnvironmentTransformer >> start: aDocumentItem [
	| object |
	"Execute clean annotation before"
	object := super start: (PRCleanAnnotationInParagraphTransformer new start: aDocumentItem).
	self hasEnvironment | currentColumn isNotNil
		ifTrue: [ PRError signal: ('Missing end of environment ''{name}''' format: {('name' -> self currentEnvironment name)} asDictionary) ].
	^ object
]

{ #category : #'visiting-annotations' }
PREnvironmentTransformer >> visitBeginEnvironmentAnnotation: anAnnotation [

	| environment |
	environment := PREnvironment named: anAnnotation name.
	anAnnotation parameters keysAndValuesDo: [ :key :value |
		environment propertyAt: key put: value ].
	self pushEnvironment: environment
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
	self hasEnvironment ifFalse: [ PRError signal: ('Missing begin of environment ''{name}''' format: {('name' -> anAnnotation name)} asDictionary) ].

	self currentEnvironment name = anAnnotation name
		ifFalse: [ PRError
				signal:
					('Mismatching environments: closing ''{closing}'' while ''{open}'' environment is open'
						format: {('closing' -> anAnnotation name) . ('open' -> self currentEnvironment name)} asDictionary) ].

	self popEnvironment.

	"Remove the end annotation from the tree.
	The end annotation marks the end of a scope and is replaced by a recursive environment structure."
	self delete
]
