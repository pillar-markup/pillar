tests
testKeepHeaderWithParagraph
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