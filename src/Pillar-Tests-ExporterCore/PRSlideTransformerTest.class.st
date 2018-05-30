Class {
	#name : #PRSlideTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRSlideTransformerTest >> actualClass [
	^ PRSlideTransformer
]

{ #category : #tests }
PRSlideTransformerTest >> testTransformAnnotationStopAtTitle [
	| input expected |
	input := PRDocument new
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Foo');
						yourself);
		yourself.
	expected := PRDocument new
		add:
				(PRSlide new
						add: (PRParagraph with: (PRText content: 'Foo!') yourself);
						yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Foo');
						yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected
]

{ #category : #tests }
PRSlideTransformerTest >> testTransformWithOneAnnotation [
	| input expected |
	input := PRDocument new
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSlide new
				add: (PRParagraph with: (PRText content: 'Foo!') yourself);
				yourself) yourself.
	self assert: (self executePhase: input) equals: expected
]

{ #category : #tests }
PRSlideTransformerTest >> testTransformWithTwoAnnotation [
	| input expected |
	input := PRDocument new
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Bar') yourself);
		yourself.
	expected := PRDocument new
		add:
				(PRSlide new
						add: (PRParagraph with: (PRText content: 'Foo!') yourself);
						yourself);
		add:
				(PRSlide new
						add: (PRParagraph with: (PRText content: 'Bar') yourself);
						yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected
]

{ #category : #tests }
PRSlideTransformerTest >> testTransformationKeepSameContent [
	| input |
	input := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Bar');
				yourself);
		add: (PRParagraph with: (PRText content: 'Foo') yourself);
		add: PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo2') yourself);
		yourself.
	self assert: (self executePhase: input) equals: input
]

{ #category : #tests }
PRSlideTransformerTest >> testTransformationWithNonGroupItemAtTopLevel [
	| input expected |
	"This test makes sure that a document item which is not a document group can be a direct child of a slide"
	input := PRDocument new
		add: PRSlideTitleAnnotation new;
		add: PRHorizontalRule new;
		yourself.
	expected := PRDocument new
		add:
			(PRSlide new
				add: PRHorizontalRule new;
				yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected
]
