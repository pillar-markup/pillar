Class {
	#name : #PRFootnoteTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRFootnoteTransformerTest >> actualClass [
	^ PRFootnoteTransformer
]

{ #category : #tests }
PRFootnoteTransformerTest >> testTransformationFootnoteWithList [
	| input expected |
	input := PRDocument new
		add:
			(PROrderedList new
				add:
					(PRListItem new
						add: (PRText content: 'Timo');
						add:
							(PRFootnoteAnnotation new
								parameterAt: 'note' put: 'Foo';
								yourself);
						add: (PRText content: 'Leon');
						yourself);
				yourself);
		yourself.
	expected := PRDocument new
		add:
			(PROrderedList new
				add:
					(PRListItem new
						add: (PRText content: 'Timo');
						add: (PRFootnote noted: 'Foo');
						add: (PRText content: 'Leon');
						yourself);
				yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]

{ #category : #tests }
PRFootnoteTransformerTest >> testTransformationFootnoteWithParagraph [
	| input expected |
	input := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: 'Timo');
				add:
					(PRFootnoteAnnotation new
						parameterAt: 'note' put: 'Foo';
						yourself);
				add: (PRText content: 'Leon');
				yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: 'Timo');
				add: (PRFootnote noted: 'Foo');
				add: (PRText content: 'Leon');
				yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected
]
