tests
testKeepHeaderWithParagraph2
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