"
A simple builder specialize for item building.
To be removed.
"
Class {
	#name : #PRUnorderedItemBuilder,
	#superclass : #PRAbstractMicrodownTextualBuilder,
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
PRUnorderedItemBuilder >> item: aBlock [
	self potentialNewLine.
	self raw: parserClass unorderedListMarkup.
	aBlock value.
	
]
