"
I am a slide. I am here to structure a document that will be export as a Slide prensentation. (PRBeamerExporter, PRDeckJSExporter...).

title is the title of the slide.

the label is a way to create a link to this slinde on the slider.
"
Class {
	#name : #PRSlide,
	#superclass : #PRDocumentGroup,
	#instVars : [
		'title',
		'label'
	],
	#category : #'Pillar-Model-Document'
}

{ #category : #'instance creation' }
PRSlide class >> titled: aTitle [
	^ self new
		title: aTitle;
		yourself
]

{ #category : #visiting }
PRSlide >> accept: aVisitor [
	^ aVisitor visitSlide: self
]

{ #category : #testing }
PRSlide >> hasLabel [
	^ label isNotNil
]

{ #category : #accessing }
PRSlide >> label [
	^ label
]

{ #category : #accessing }
PRSlide >> label: anObject [
	label := anObject
]

{ #category : #accessing }
PRSlide >> title [
	^ title ifNil: [ 'New Slide' ]
]

{ #category : #accessing }
PRSlide >> title: anObject [
	title := anObject
]
