"
Style as subscript
"
Class {
	#name : 'PRSubscriptFormat',
	#superclass : 'PRFormat',
	#category : 'Pillar-Model-Document',
	#package : 'Pillar-Model',
	#tag : 'Document'
}

{ #category : 'visiting' }
PRSubscriptFormat >> accept: aVisitor [
	^ aVisitor visitSubscriptFormat: self
]
