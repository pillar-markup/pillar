Extension { #name : #PRSectionTransformerTest }

{ #category : #'*Pillar-Tests-ExporterPillar' }
PRSectionTransformerTest >> testTransformationKeepSameContent [
	| input |
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
	self
		assert: (PRPillarWriter write: (self executePhase: input with: self configuration))
		equals: (PRPillarWriter write: input)
]
