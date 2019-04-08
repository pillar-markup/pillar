Class {
	#name : #PRCustomTagTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : #'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRCustomTagTransformerTest >> actualClass [
	^PRCitationTransformer
]

{ #category : #tests }
PRCustomTagTransformerTest >> testTransformWithAnnotationAndText [
	| input expected |
	input := PRDocument new
		add:
			(PRParagraph new
				add: (PRText new text: 'hello');
				add: PRCitationAnnotation new;
				add: (PRText new text: 'hello');
				yourself).
	expected := PRDocument new
		add:
			(PRParagraph new
				add: (PRText new text: 'hello');
				add: (PRCitation new);
				add: (PRText new text: 'hello');
				yourself).
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRCustomTagTransformerTest >> testTransformWithListInList [
	| input expected |
	input := PRDocument new
		add:
			(PROrderedList new
				add:
					(PRUnorderedList new
						add: PRCitationAnnotation new;
						yourself);
				yourself).
	expected := PRDocument new
		add:
			(PROrderedList new
				add:
					(PRUnorderedList new
						add: PRCitation new;
						yourself);
				yourself).
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRCustomTagTransformerTest >> testTransformWithOneAnnotation [
	| input expected |
	input := PRDocument new
		add: PRCitationAnnotation new;
		yourself.
	expected := PRDocument new add: PRCitation new.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRCustomTagTransformerTest >> testTransformWithOneAnnotationithRef [
	| input expected |
	input := PRDocument new
		add:
			(PRCitationAnnotation new
				parameterAt: 'ref' put: 'foo';
				yourself).
	expected := PRDocument new add: (PRCitation ref: 'foo').
	self assert: (self executePhase: input with: self configuration) equals: expected
]
