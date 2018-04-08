tests
testTransformWith3Headers
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