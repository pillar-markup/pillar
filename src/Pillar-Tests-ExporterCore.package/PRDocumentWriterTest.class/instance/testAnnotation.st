tests
testAnnotation
	| item |
	{ 'note' . 'dothis' } do:
	[	:annotation |	
		item := PRAnnotatedParagraph new
			annotation: annotation;
			add: (PRText content: 'foo');
			yourself.
		self 
			assertWriting: item
			includesTexts: 
				{self annotationBegin: annotation . 'foo'}. 
	].