tests
testExport2SlidesCloseAllFrames
	"self debug: #testExportSlideTitle"

	| item resultString index |
	item := PRDocument new
		add: (PRSlide titled: 'Slide 1');
		add: (PRSlide titled: 'Slide 2');
		yourself.
	resultString := self write: item.
	index := resultString findString: self endSlideTag startingAt: 0.
	self assert: index > 0.
	index := resultString findString: self endSlideTag startingAt: index + 1.
	self assert: index > 0