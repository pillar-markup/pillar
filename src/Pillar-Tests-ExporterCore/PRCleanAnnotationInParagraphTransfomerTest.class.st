Class {
	#name : #PRCleanAnnotationInParagraphTransfomerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRCleanAnnotationInParagraphTransfomerTest >> actualClass [
	^ PRCleanAnnotationInParagraphTransfomer
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
	| document result misc annotation |
	annotation := self exampleAnnotation.
	misc := self exampleMisc.
	document := PRDocument
		with:
			(PRParagraph
				withAll:
					{annotation.
					misc}).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation.
	result := self executePhase: document.
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldNotRemoveWhenSomethingElseThanAnnotationInParagraph [
	| document result misc |
	misc := self exampleMisc.
	document := PRDocument with: (PRParagraph with: misc).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = misc.
	result := self executePhase: document.
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = misc
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldRemoveWhenAnnotationAloneInParagraph [
	| document result annotation |
	annotation := self exampleAnnotation.
	document := PRDocument with: (PRParagraph with: annotation).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation.
	result := self executePhase: document.
	self deny: (document children first isKindOf: PRParagraph).
	self assert: document children first = annotation
]

{ #category : #tests }
PRCleanAnnotationInParagraphTransfomerTest >> testShouldRemoveWhenAnnotationAloneWithLineBreakInParagraph [
	| document result misc annotation |
	annotation := self exampleAnnotation.
	misc := PRLineBreak new.
	document := PRDocument
		with:
			(PRParagraph
				withAll:
					{annotation.
					misc}).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation.
	result := self executePhase: document.
	self deny: (document children first isKindOf: PRParagraph).
	self assert: document children first = annotation.
	self assert: document children size equals: 1
]
