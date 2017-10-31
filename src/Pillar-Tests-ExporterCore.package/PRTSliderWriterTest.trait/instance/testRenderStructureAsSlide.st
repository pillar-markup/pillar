tests
testRenderStructureAsSlide
	| item |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Foo');
						yourself);
		add: (PRSlide titled: 'Slide');
		yourself.
	self configuration renderStructureAsSlide: true.
	self assertWriting: item includesTexts: {(self headerInSlide)}.
	self configuration renderStructureAsSlide: false.
	self deny: [ (self write: item) includesSubstring: self headerInSlide ]