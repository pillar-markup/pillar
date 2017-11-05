tests
testslideWithLabel
	"self debug: #testExportSlideTitle"

	| item |
	item := PRDocument new
		add:
				((PRSlide titled: 'Slide title')
						label: 'Foo';
						yourself);
		yourself.
	self assertWriting: item includesTexts: {(self representationOfAnchor)}