"
Style as superscript
"
Class {
	#name : 'PRSuperscriptFormat',
	#superclass : 'PRFormat',
	#category : 'Pillar-Model-Document',
	#package : 'Pillar-Model',
	#tag : 'Document'
}

{ #category : 'visiting' }
PRSuperscriptFormat >> accept: aVisitor [
	^ aVisitor visitSuperscriptFormat: self
]
