tests
testTitleOfSlide
	"self debug: #testExportSlideTitle"

	| item |
	item := PRDocument new
		add: (PRSlide titled: 'Slide title');
		yourself.
	self
		assertWriting: item
		includesTexts: self slideTitle.