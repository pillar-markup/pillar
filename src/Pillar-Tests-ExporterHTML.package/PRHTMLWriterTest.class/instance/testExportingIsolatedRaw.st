tests
testExportingIsolatedRaw
	"The idea is that you don''t want the <p> when using a Raw that potentially displays a <div>, because this is not HTML compliant"

	| item |
	item := PRDocument new
		add:
				(PRParagraph new
						add: (PRRaw content: '<div>foo</div>');
						yourself);
		yourself.
	self assert: (self write: item) equals: '<div>foo</div>'