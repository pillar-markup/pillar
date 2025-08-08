"
I am an ordered list. I am typically used for numbered items.
"
Class {
	#name : 'PROrderedList',
	#superclass : 'PRList',
	#category : 'Pillar-Core-Model',
	#package : 'Pillar-Core',
	#tag : 'Model'
}

{ #category : 'visiting' }
PROrderedList >> accept: aVisitor [
	^ aVisitor visitOrderedList: self
]
