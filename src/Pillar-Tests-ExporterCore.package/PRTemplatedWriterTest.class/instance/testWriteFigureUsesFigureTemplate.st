tests-templatefiles
testWriteFigureUsesFigureTemplate

	self
		assertTemplate: PRTemplatedWriter figureTemplateFileName
		writesValue: 'figure'
		forNode: (PRFigure reference: 'bla.png')