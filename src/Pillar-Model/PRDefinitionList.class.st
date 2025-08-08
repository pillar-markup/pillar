"
I am an definition list. I am typically used for a keyword and a longer definition string.
"
Class {
	#name : 'PRDefinitionList',
	#superclass : 'PRList',
	#category : 'Pillar-Model-Document',
	#package : 'Pillar-Model',
	#tag : 'Document'
}

{ #category : 'visiting' }
PRDefinitionList >> accept: aVisitor [
	^ aVisitor visitDefinitionList: self
]
