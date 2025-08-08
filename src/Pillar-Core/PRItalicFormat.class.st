"
Format can be nested.

`""""bold ''italic''bold""""` shows **bold_italic_bold**
"
Class {
	#name : 'PRItalicFormat',
	#superclass : 'PRFormat',
	#category : 'Pillar-Core-Model',
	#package : 'Pillar-Core',
	#tag : 'Model'
}

{ #category : 'visiting' }
PRItalicFormat >> accept: aVisitor [
	^ aVisitor visitItalicFormat: self
]
