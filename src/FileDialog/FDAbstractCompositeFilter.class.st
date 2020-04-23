"
i define compose predicate 
	see my super class for more information
"
Class {
	#name : #FDAbstractCompositeFilter,
	#superclass : #FDAbstractFilter,
	#instVars : [
		'collectionOfFDAbstractFilter'
	],
	#category : #'FileDialog-filterStrategie'
}

{ #category : #actions }
FDAbstractCompositeFilter class >> actions [
	^self allSubclasses collect: [:item |item new ]
]

{ #category : #testing }
FDAbstractCompositeFilter class >> isAbstract [ 
	^ self = FDAbstractCompositeFilter
]

{ #category : #accessing }
FDAbstractCompositeFilter >> collectionOfFDAbstractFilter [
	^ collectionOfFDAbstractFilter
]

{ #category : #accessing }
FDAbstractCompositeFilter >> collectionOfFDAbstractFilter: anObject [
	collectionOfFDAbstractFilter := anObject
]
