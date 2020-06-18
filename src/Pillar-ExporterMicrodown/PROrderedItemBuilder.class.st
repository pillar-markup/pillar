"
A simple builder specialize for item building.
To be removed!
"
Class {
	#name : #PROrderedItemBuilder,
	#superclass : #PRAbstractMicrodownTextualBuilder,
	#instVars : [
		'i'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #initialization }
PROrderedItemBuilder >> initialize [ 
	super initialize.
	i := 0.
]

{ #category : #accessing }
PROrderedItemBuilder >> item: aBlock [
	self newLine.
	i := i + 1.
	self writeOrderedListIndex.
	aBlock value.
	
]

{ #category : #accessing }
PROrderedItemBuilder >> writeOrderedListIndex [
	self raw: i asString.
	self raw: parserClass orderedListSemiMarkup 
]
