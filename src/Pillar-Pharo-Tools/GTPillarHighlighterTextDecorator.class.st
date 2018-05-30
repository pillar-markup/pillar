Class {
	#name : #GTPillarHighlighterTextDecorator,
	#superclass : #GLMHighlighterTextStylerDecorator,
	#instVars : [
		'presentation',
		'fileReference'
	],
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #'as yet unclassified' }
GTPillarHighlighterTextDecorator class >> inPresentation: aGLMRubricPresentation [
	^ self new presentation: aGLMRubricPresentation 
]

{ #category : #'as yet unclassified' }
GTPillarHighlighterTextDecorator class >> inPresentation: aGLMRubricPresentation fileReference: aFileReference [
	^ self new 
		presentation: aGLMRubricPresentation;
		fileReference: aFileReference 
]

{ #category : #'as yet unclassified' }
GTPillarHighlighterTextDecorator class >> key [
	^ self name
]

{ #category : #accessing }
GTPillarHighlighterTextDecorator >> defaultStyler [

	^ GLMHighlighterTextParserStyler new
		view: self;
		parser: self

	
]

{ #category : #accessing }
GTPillarHighlighterTextDecorator >> fileReference [
	^ fileReference
]

{ #category : #accessing }
GTPillarHighlighterTextDecorator >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #parsing }
GTPillarHighlighterTextDecorator >> parse: aString onError: anError [
	| result highlighter |
	result := aString asText.
	highlighter := GTPillarHighlighter new.
	highlighter parse: aString.
	highlighter commands do: [ :each | 
		each 
			executeOn: result 
			inPresentation: self presentation 
			relativeToFileReference: self fileReference ].
	^ result
]

{ #category : #accessing }
GTPillarHighlighterTextDecorator >> parser [
	^ self
]

{ #category : #accessing }
GTPillarHighlighterTextDecorator >> presentation [
	^ presentation
]

{ #category : #accessing }
GTPillarHighlighterTextDecorator >> presentation: anObject [
	presentation := anObject
]
