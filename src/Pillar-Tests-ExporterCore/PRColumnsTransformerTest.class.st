Class {
	#name : #PRColumnsTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRColumnsTransformerTest >> actualClass [
	^ PRColumnsTransformer
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationBeginningColumnsWithoutEnding [
	| input |
	input := PRDocument
		withAll:
			{PRColumnsAnnotation new.
			(PRColumnAnnotation
				withParameters:
					(OrderedDictionary new
						at: 'width' put: '100';
						yourself)).
			(PRText content: 'Foo')}.
	self should: [ self executePhase: input ] raise: PRError whoseDescriptionIncludes: 'Missing end' description: 'Code must detect the absence of end annotation'
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationEndColumnsWithoutBeginning [
	| input |
	input := PRDocument with: PREndColumnsAnnotation new.
	self should: [ (self executePhase: input with: self configuration) ] raise: PRError whoseDescriptionIncludes: 'out of a column environment' description: 'Code should detect a missing annotation'
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationOnColumn [
	| input expected |
	input := PRDocument new
		add:
				PRColumnsAnnotation new;
		add:
				(PRColumnAnnotation withParameters: (OrderedDictionary new
								at: 'width' put: '100';
								yourself) yourself);
		add:	(PRParagraph new
						add: (PRText content: 'Foo');
						yourself);
		add:
				PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
				(PRColumns new
						add:
							((PRColumn width: '100')
								add:
										(PRParagraph new
												add: (PRText content: 'Foo');
												yourself);
								yourself));
		yourself.
	self assert: (self executePhase: input) equals: expected
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationTwoColumns [
	| input expected |
	input := PRDocument new
		add: PRColumnsAnnotation new;
		add:
			(PRColumnAnnotation
				withParameters:
					(OrderedDictionary new
						at: 'width' put: '50';
						yourself) yourself);
		add:
			(PRParagraph new
				add: (PRText content: 'Foo');
				yourself);
		add:
			(PRColumnAnnotation
				withParameters:
					(OrderedDictionary new
						at: 'width' put: '50';
						yourself) yourself);
		add:
			(PRParagraph new
				add: (PRText content: 'Bar');
				yourself);
		add: PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
			(PRColumns new
				add:
					((PRColumn width: '50')
						add:
							(PRParagraph new
								add: (PRText content: 'Foo');
								yourself));
				add:
					((PRColumn width: '50')
						add:
							(PRParagraph new
								add: (PRText content: 'Bar');
								yourself);
						yourself));
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationWithColumnWithoutColumns [
	| input |
	input := PRDocument new
		add: PRColumnAnnotation new;
		add:
			(PRParagraph new
				add: (PRText content: 'Foo');
				yourself);
		add: PREndColumnsAnnotation new;
		yourself.
	self
		should: [ self executePhase: input ]
		raise: PRError
		whoseDescriptionIncludes: 'not inside a column environment'
		description: 'Code is missing a check'
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationWithColumnsInColumns [
	| input |
	input := PRDocument new
		add:
				PRColumnsAnnotation new;
		add:
				PRColumnsAnnotation new;
		add:
				PREndColumnsAnnotation new;
		add:
				PREndColumnsAnnotation new;
		yourself.
	self should: [ self executePhase: input ] raise: PRError whoseDescriptionIncludes: 'close a columns environment' description: 'Code is missing a check'
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationWithContentInsideColumnsBeforeColumn [
	| input expected |
	input := PRDocument new
		add:
				PRColumnsAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo') yourself);
		add:
				(PRColumnAnnotation withParameters: ((OrderedDictionary new
								at: 'width' put: '100';
								yourself)) yourself);
		add: (PRParagraph with: (PRText content: 'Bar') yourself);
		add:
				PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
				(PRColumns new
						add: (PRParagraph with: (PRText content: 'Foo') yourself);
						add: ((PRColumn width: '100') add: (PRParagraph with: (PRText content: 'Bar') yourself) yourself);
						yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationWithNonGroupItemAtTopLevel [
	| input expected |
	"This test makes sure that a document item which is not a document group can be a direct child of a column"
	input := PRDocument new
		add: PRColumnsAnnotation new;
		add:
			(PRColumnAnnotation
				withParameters:
					(OrderedDictionary new
						at: 'width' put: '100';
						yourself) yourself);
		add: PRHorizontalRule new;
		add: PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
			(PRColumns new
				add:
					((PRColumn width: '100')
						add: PRHorizontalRule new;
						yourself));
		yourself.
	self assert: (self executePhase: input) equals: expected
]

{ #category : #tests }
PRColumnsTransformerTest >> testTransformationWithoutColumns [
	| input |
	input := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Foo');
						yourself);
		add: (PRParagraph with: (PRText content: 'Bar') yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: input
]
