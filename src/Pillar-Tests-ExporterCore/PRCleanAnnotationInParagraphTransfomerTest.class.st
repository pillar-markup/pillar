Class {
	#name : #PRCleanAnnotationInParagraphTransfomerTest,
	#superclass : #PRNodeTransformerTest,
	#category : #'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRCleanAnnotationInParagraphTransfomerTest >> actualClass [
	^ PRCleanAnnotationInParagraphTransformer
]

{ #category : #helpers }
PRCleanAnnotationInParagraphTransfomerTest >> exampleAnnotation [
	^ PRFootnoteAnnotation new
		parameterAt: 'note' put: 'Foo';
		yourself
]

{ #category : #helpers }
PRCleanAnnotationInParagraphTransfomerTest >> exampleMisc [
	^ PRText content: 'foo'
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldNotBreakWithEmptyParagraph [
	| document |
	document := PRDocument with: PREmptyParagraph new.
	self executePhase: document
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldNotRemoveWhenSomethingElseFollowsTheAnnotationInParagraph [
	| document misc annotation |
	annotation := self exampleAnnotation.
	misc := self exampleMisc.
	document := PRDocument with: (PRParagraph withAll: {annotation . misc}).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first equals: annotation.
	self executePhase: document.
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first equals: annotation
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldNotRemoveWhenSomethingElseThanAnnotationInParagraph [
	| document misc |
	misc := self exampleMisc.
	document := PRDocument with: (PRParagraph with: misc).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first equals: misc.
	self executePhase: document.
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first equals: misc
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldRemoveWhenAnnotationAloneInParagraph [
	| document annotation |
	annotation := self exampleAnnotation.
	document := PRDocument with: (PRParagraph with: annotation).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first equals: annotation.
	self executePhase: document.
	self deny: (document children first isKindOf: PRParagraph).
	self assert: document children first equals: annotation
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldRemoveWhenAnnotationAloneWithLineBreakInParagraph [
	| document misc annotation |
	annotation := self exampleAnnotation.
	misc := PRLineBreak new.
	document := PRDocument with: (PRParagraph withAll: {annotation . misc}).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first equals: annotation.
	self executePhase: document.
	self deny: (document children first isKindOf: PRParagraph).
	self assert: document children first equals: annotation.
	self assert: document children size equals: 1
]
