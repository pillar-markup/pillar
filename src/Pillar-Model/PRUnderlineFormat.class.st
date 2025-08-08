"
Style as underline formatted
"
Class {
	#name : 'PRUnderlineFormat',
	#superclass : 'PRFormat',
	#category : 'Pillar-Model-Document',
	#package : 'Pillar-Model',
	#tag : 'Document'
}

{ #category : 'visiting' }
PRUnderlineFormat >> accept: aVisitor [
	^ aVisitor visitUnderlineFormat: self
]
