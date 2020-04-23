"
i'm an abstract class use by the filter system of FDFileDialog


my subclass define:

	predicat: aFileReference
		return a boolean 
	name 
		return String 
		
this architecture is composed of 2 class 

	FDAbstractSimplePredicate
		it's compose of lightest predicate 
	FDAbstractCompositePredicate
		it's compose of predicate compose of FAbstractPredicate
"
Class {
	#name : #FDAbstractFilter,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'FileDialog-filterStrategie'
}

{ #category : #actions }
FDAbstractFilter class >> actions [
	| filterCollection |
	filterCollection := {}.
	self allSubclasses
		do: [ :class |filterCollection := filterCollection | class actions ].
	^ filterCollection
]

{ #category : #testing }
FDAbstractFilter class >> isAbstract [
	^ self = FDAbstractFilter
]

{ #category : #applying }
FDAbstractFilter >> applyOn: aCollectionOfFileReference [
	^ aCollectionOfFileReference select: [:eachFileReference | self predicate: eachFileReference   ]
]

{ #category : #comparing }
FDAbstractFilter >> equals: aPredicate [
	^ self className = aPredicate className
]

{ #category : #accessing }
FDAbstractFilter >> name [
	^ self subclassResponsibility 
]

{ #category : #accessing }
FDAbstractFilter >> predicate: aFileReference [
	^ self subclassResponsibility 
]
