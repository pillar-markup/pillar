Class {
	#name : #PRSectionTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRSectionTransformerTest >> actualClass [

	^ PRSectionTransformer
]

{ #category : #tests }
PRSectionTransformerTest >> testTransformWithChangedMaxDepthLevel [
	| input expected |
	input := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'Bar') yourself);
		add: (PRParagraph with: (PRText content: 'Foo') yourself);
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'Bar2') yourself);
		add: (PRParagraph with: (PRText content: 'Foo2') yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
					(PRHeader new
						level: 1;
						add: (PRText content: 'Bar') yourself);
				add: (PRParagraph with: (PRText content: 'Foo') yourself);
				add:
					(PRHeader new
						level: 2;
						add: (PRText content: 'Bar2') yourself);
				add: (PRParagraph with: (PRText content: 'Foo2') yourself);
				yourself) yourself.
	self actualClass maxDepthLevel: 1.
	self
		assert: (self executePhase: input with: self configuration)
		equals: expected.	"After the test we reinitialize the PRSectionTransformer to get the normal MaxDepthLevel"
	self actualClass initialize
]

{ #category : #tests }
PRSectionTransformerTest >> testTransformWithOneSection [
	| input expected |
	input := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Bar') yourself);
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
						(PRHeader new
								level: 1;
								add: (PRText content: 'Bar') yourself);
				add: (PRParagraph with: (PRText content: 'Foo!') yourself);
				yourself) yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRSectionTransformerTest >> testTransformWithParagraphBeforeSection [
	| input expected |
	input := PRDocument new
		add: (PRParagraph with: (PRText content: 'Hello World') yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Bar') yourself);
		add: (PRParagraph with: (PRText content: 'Foo') yourself);
		yourself.
	expected := PRDocument new
		add: (PRParagraph with: (PRText content: 'Hello World') yourself);
		add:
				(PRSection new
						add:
								(PRHeader new
										level: 1;
										add: (PRText content: 'Bar') yourself);
						add: (PRParagraph with: (PRText content: 'Foo') yourself);
						yourself) yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRSectionTransformerTest >> testTransformWithTwoSections [
	| input expected |
	input := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Bar');
						yourself);
		add: (PRParagraph with: (PRText content: 'Foo') yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Bar2');
						yourself);
		add: (PRParagraph with: (PRText content: 'Foo2') yourself);
		yourself.
	expected := PRDocument new
		add:
				(PRSection new
						add:
								(PRHeader new
										level: 1;
										add: (PRText content: 'Bar');
										yourself);
						add: (PRParagraph with: (PRText content: 'Foo') yourself);
						yourself);
		add:
				(PRSection new
						add:
								(PRHeader new
										level: 1;
										add: (PRText content: 'Bar2');
										yourself);
						add: (PRParagraph with: (PRText content: 'Foo2') yourself);
						yourself) yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRSectionTransformerTest >> testTransformWithoutSection [
	| input |
	input := PRDocument new
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: input
]
