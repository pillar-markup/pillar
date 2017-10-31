tests
testExport1SimpleSlide
	"self debug: #testExportSlideTitle"

	| item |
	item := PRDocument new
		add: (PRSlide titled: 'Slide title');
		add: (PRText content: 'Presentation text');
		yourself.
	self
		assertWriting: item
		includesTexts: self slideRepresentation.