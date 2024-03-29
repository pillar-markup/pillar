"
I am the root of a document composite.
"
Class {
	#name : #PRDocument,
	#superclass : #PRDocumentGroup,
	#category : #'Pillar-Core-Model'
}

{ #category : #visiting }
PRDocument >> accept: aVisitor [
	^ aVisitor visitDocument: self
]

{ #category : #'common-properties' }
PRDocument >> authors [
	^ self propertyAt: 'authors' ifAbsent: [ self defaultAuthors ]
]

{ #category : #'common-properties' }
PRDocument >> date [
	^ (self propertyAt: 'date' ifAbsent: [ self defaultDate ]) asDate
]

{ #category : #'common-defaults' }
PRDocument >> defaultAuthors [
	^ ''
]

{ #category : #'common-defaults' }
PRDocument >> defaultDate [
	^ Date today
]

{ #category : #'common-defaults' }
PRDocument >> defaultNext [
	^ nil
]

{ #category : #'pillar integration' }
PRDocument >> includeFor: aFile [

	| inclusionVisitor |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: aFile file.
	^ inclusionVisitor start: (PRCleanAnnotationInParagraphTransformer new start: self).
]

{ #category : #'common-properties' }
PRDocument >> next [
	^ self propertyAt: 'next' ifAbsent: [ self defaultNext ]
]

{ #category : #'common-properties' }
PRDocument >> next: aDocument [
	^ self propertyAt: 'next' put: aDocument
]

{ #category : #'pillar integration' }
PRDocument >> transformDocumentFor: aPRPDFDocument [
	"This is a hook to be able to have framework specific transformation hooks.
	see PRAbstractOutputDocument>>#buildOn:"
	
	^ aPRPDFDocument transformDocument: self
]
