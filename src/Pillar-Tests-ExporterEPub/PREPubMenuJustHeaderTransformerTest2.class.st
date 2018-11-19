Class {
	#name : #PREPubMenuJustHeaderTransformerTest2,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterEPub'
}

{ #category : #private }
PREPubMenuJustHeaderTransformerTest2 >> actualClass [
	^ PREPubMenuJustHeaderTransformer
]

{ #category : #private }
PREPubMenuJustHeaderTransformerTest2 >> actualWriterClass [
	^ PREPubTocMenuWriter
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> expected: expected withInput: input [
	self
		assert:
			(self
				executePhase: input
				with:
					(self configuration
						propertyAt: #_outputFormat put: self actualWriterClass new;
						yourself))
		equals: expected
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> testKeepHeaderWithOneHeader [
	| input expected |
	input := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'foo');
				yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
					(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						yourself);
				yourself);
		yourself.
	self expected: expected withInput: input
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> testKeepHeaderWithParagraph [
	| input expected |
	input := PRDocument new
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'foo');
				yourself);
		add: (PRParagraph new add: (PRText content: 'bar'));
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
					(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						yourself)).
	self expected: expected withInput: input
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> testKeepHeaderWithParagraph2 [
	| input expected |
	input := PRDocument new
		add: (PRParagraph new add: (PRText content: 'bar'));
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'foo');
				yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
					(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						yourself)).
	self expected: expected withInput: input
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> testKeepHeaderWithScript [
	| input expected |
	input := PRDocument new
		add: (PRCodeblock content: 'hello');
		add:
			(PRHeader new
				level: 1;
				add: (PRText content: 'foo');
				yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
					(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						yourself)).
	self expected: expected withInput: input
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> testTransformWith2Headers [
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
				add:
					(PRSection new
						add:
							(PRHeader new
								level: 2;
								add: (PRText content: 'Bar2') yourself))) yourself.
	self expected: expected withInput: input
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> testTransformWith3Headers [
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
		yourself;
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'Bar2b') yourself);
		add: (PRParagraph with: (PRText content: 'Foo2') yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSection new
				add:
					(PRHeader new
						level: 1;
						add: (PRText content: 'Bar') yourself);
				add:
					(PRSection new
						add:
							(PRHeader new
								level: 2;
								add: (PRText content: 'Bar2') yourself));
				add:
					(PRSection new
						add:
							(PRHeader new
								level: 2;
								add: (PRText content: 'Bar2b')))) yourself.
	self expected: expected withInput: input
]

{ #category : #tests }
PREPubMenuJustHeaderTransformerTest2 >> testTransformWithOneSection [
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
				yourself) yourself.
	self expected: expected withInput: input
]
