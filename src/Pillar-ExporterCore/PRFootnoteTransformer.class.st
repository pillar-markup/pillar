"
I replace each ==footnote== annotation with a structure of footnote.
"
Class {
	#name : #PRFootnoteTransformer,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #testing }
PRFootnoteTransformer class >> isAbstract [
	^ false
]

{ #category : #private }
PRFootnoteTransformer >> createFootnote: aFootnoteAnnotation [
	^ PRFootnote noted: (aFootnoteAnnotation parameters at: 'note')
]

{ #category : #'visiting-annotations' }
PRFootnoteTransformer >> visitFootnoteAnnotation: aFootnoteAnnotation [
	self replace: {(self createFootnote: aFootnoteAnnotation)}
]
