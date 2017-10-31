as yet unclassified
testCheckRawWithWrongType
	| input |
	input := PRDocument new
		add:
			(PRParagraph new
				add: (PRRaw content: 'bar' type: 'foo');
				yourself);
		yourself.
	self
		should: [ self actualClass executeOn: (PRCompilationContext withDocument: input withConfiguration: self configurationClass new ) ]
		raise: PRWarning