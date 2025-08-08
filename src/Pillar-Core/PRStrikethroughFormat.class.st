"
Strikethrough format
"
Class {
	#name : 'PRStrikethroughFormat',
	#superclass : 'PRFormat',
	#category : 'Pillar-Core-Model',
	#package : 'Pillar-Core',
	#tag : 'Model'
}

{ #category : 'visiting' }
PRStrikethroughFormat >> accept: aVisitor [
	^ aVisitor visitStrikethroughFormat: self
]
