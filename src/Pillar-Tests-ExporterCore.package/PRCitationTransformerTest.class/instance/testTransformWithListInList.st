tests
testTransformWithListInList
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